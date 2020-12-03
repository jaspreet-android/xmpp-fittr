%%%-------------------------------------------------------------------
%%% @author Stephen Röttger <stephen.roettger@googlemail.com>
%%%
%%% Copyright (C) 2002-2020 ProcessOne, SARL. All Rights Reserved.
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%%
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.
%%%
%%%-------------------------------------------------------------------
-module(xmpp_sasl_scram).
-behaviour(xmpp_sasl).
-author('stephen.roettger@googlemail.com').
-protocol({rfc, 5802}).

-export([mech_new/6, mech_step/2, format_error/1]).

-include("scram.hrl").

-type password() :: binary() | #scram{}.
-type get_password_fun() :: fun((binary()) -> {false | password(), module()}).

-record(state,
	{step = 2              :: 2 | 4,
         algo = sha            :: sha | sha256 | sha512,
	 plus = false          :: boolean(),
	 plus_data = <<>>      :: binary(),
         stored_key = <<"">>   :: binary(),
         server_key = <<"">>   :: binary(),
         username = <<"">>     :: binary(),
	 auth_module           :: module(),
         get_password          :: get_password_fun(),
         auth_message = <<"">> :: binary(),
         client_nonce = <<"">> :: binary(),
	 server_nonce = <<"">> :: binary()}).

-define(SALT_LENGTH, 16).
-define(NONCE_LENGTH, 16).

-type error_reason() :: unsupported_extension | bad_username |
			not_authorized | saslprep_failed |
			parser_failed | bad_attribute |
			nonce_mismatch | bad_channel_binding.

-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error(unsupported_extension) ->
    {'not-authorized', <<"Unsupported extension">>};
format_error(bad_username) ->
    {'invalid-authzid', <<"Malformed username">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid username or password">>};
format_error(saslprep_failed) ->
    {'not-authorized', <<"SASLprep failed">>};
format_error(parser_failed) ->
    {'not-authorized', <<"Response decoding failed">>};
format_error(bad_attribute) ->
    {'not-authorized', <<"Malformed or unexpected attribute">>};
format_error(nonce_mismatch) ->
    {'not-authorized', <<"Nonce mismatch">>};
format_error(bad_channel_binding) ->
    {'not-authorized', <<"Invalid channel binding">>};
format_error(incompatible_mechs) ->
    {'not-authorized', <<"Incompatible SCRAM methods">>}.

mech_new(Mech, Socket, _Host, GetPassword, _CheckPassword, _CheckPasswordDigest) ->
    {Algo, Plus} =
    case Mech of
	<<"SCRAM-SHA-1">> -> {sha, false};
	<<"SCRAM-SHA-1-PLuS">> -> {sha, true};
	<<"SCRAM-SHA-256">> -> {sha256, false};
	<<"SCRAM-SHA-256-PLuS">> -> {sha256, true};
	<<"SCRAM-SHA-512">> -> {sha512, false};
	<<"SCRAM-SHA-512-PLUS">> -> {sha512, true}
    end,
    PlusData = case Plus of
		   true ->
		       xmpp_socket:get_peer_certificate(Socket, peer);
		   _ ->
		       <<>>
	       end,
    #state{step = 2, get_password = GetPassword, algo = Algo,
	   plus = Plus, plus_data = PlusData}.

mech_step(#state{step = 2, algo = Algo} = State, ClientIn) ->
    case re:split(ClientIn, <<",">>, [{return, binary}]) of
      [_CBind, _AuthorizationIdentity, _UserNameAttribute, _ClientNonceAttribute, ExtensionAttribute | _]
	  when ExtensionAttribute /= <<"">> ->
	  {error, unsupported_extension};
      [CBind, _AuthorizationIdentity, UserNameAttribute, ClientNonceAttribute | _] ->
          case {cbind_valid(State, CBind), parse_attribute(UserNameAttribute)} of
              {false, _} ->
                  {error, bad_channel_binding};
              {_, {error, Reason}} ->
                  {error, Reason};
              {_, {_, EscapedUserName}} ->
		case unescape_username(EscapedUserName) of
		  error -> {error, bad_username};
		  UserName ->
		      case parse_attribute(ClientNonceAttribute) of
			{$r, ClientNonce} ->
			    {Pass, AuthModule} = (State#state.get_password)(UserName),
			    LPass = if is_binary(Pass) -> jid:resourceprep(Pass);
				       true -> Pass
				    end,
			    case Pass of
				false ->
				  {error, not_authorized, UserName};
				#scram{} when Algo /= sha ->
				  {error, incompatible_mechs};
				_ when LPass == error ->
				  {error, saslprep_failed, UserName};
				_ ->
				  {StoredKey, ServerKey, Salt, IterationCount} =
				  case Pass of
				      #scram{storedkey = STK, serverkey = SEK, salt = Slt,
					     iterationcount = IC} ->
					  {base64:decode(STK),
					   base64:decode(SEK),
					   base64:decode(Slt), IC};
				      _ ->
					  TempSalt =
					  p1_rand:bytes(?SALT_LENGTH),
					  SaltedPassword =
					  scram:salted_password(Algo, Pass,
								TempSalt,
								?SCRAM_DEFAULT_ITERATION_COUNT),
					  {scram:stored_key(Algo, scram:client_key(Algo, SaltedPassword)),
					   scram:server_key(Algo, SaltedPassword),
					   TempSalt,
					   ?SCRAM_DEFAULT_ITERATION_COUNT}
				  end,
				  ClientFirstMessageBare =
				      substr(ClientIn,
                                                 str(ClientIn, <<"n=">>)),
				  ServerNonce =
				      base64:encode(p1_rand:bytes(?NONCE_LENGTH)),
				  ServerFirstMessage =
                                        iolist_to_binary(
                                          ["r=",
                                           ClientNonce,
                                           ServerNonce,
                                           ",", "s=",
                                           base64:encode(Salt),
                                           ",", "i=",
                                           integer_to_list(IterationCount)]),
				  {continue, ServerFirstMessage,
				   State#state{step = 4, stored_key = StoredKey,
					       server_key = ServerKey,
					       auth_module = AuthModule,
					       auth_message =
						   <<ClientFirstMessageBare/binary,
						     ",", ServerFirstMessage/binary>>,
					       client_nonce = ClientNonce,
					       server_nonce = ServerNonce,
					       username = UserName}}
			    end;
			  _ -> {error, bad_attribute}
		      end
		end
	  end;
      _Else -> {error, parser_failed}
    end;
mech_step(#state{step = 4, algo = Algo} = State, ClientIn) ->
    case tokens(ClientIn, <<",">>) of
      [GS2ChannelBindingAttribute, NonceAttribute,
       ClientProofAttribute] ->
	  case parse_attribute(GS2ChannelBindingAttribute) of
	    {$c, CVal} ->
		ChannelBindingSupport = try base64:decode(CVal)
					catch _:badarg -> <<>>
					end,
		case cbind_verify(State, ChannelBindingSupport) of
	          true ->
		    Nonce = <<(State#state.client_nonce)/binary,
				(State#state.server_nonce)/binary>>,
		    case parse_attribute(NonceAttribute) of
			{$r, CompareNonce} when CompareNonce == Nonce ->
			    case parse_attribute(ClientProofAttribute) of
			    {$p, ClientProofB64} ->
				  ClientProof = try base64:decode(ClientProofB64)
						catch _:badarg -> <<>>
						end,
				  AuthMessage = iolist_to_binary(
						    [State#state.auth_message,
						     ",",
						     substr(ClientIn, 1,
								    str(ClientIn, <<",p=">>)
								    - 1)]),
				  ClientSignature =
				    scram:client_signature(Algo, State#state.stored_key,
							     AuthMessage),
				  ClientKey = scram:client_key_xor(ClientProof,
								   ClientSignature),
				  CompareStoredKey = scram:stored_key(Algo, ClientKey),
				  if CompareStoredKey == State#state.stored_key ->
					 ServerSignature =
					     scram:server_signature(Algo,
								    State#state.server_key,
								    AuthMessage),
					 {ok, [{username, State#state.username},
					       {auth_module, State#state.auth_module},
					       {authzid, State#state.username}],
					  <<"v=",
					    (base64:encode(ServerSignature))/binary>>};
				     true -> {error, not_authorized, State#state.username}
				  end;
			    _ -> {error, bad_attribute}
			    end;
			{$r, _} -> {error, nonce_mismatch};
			_ -> {error, bad_attribute}
		    end;
		  _ -> {error, bad_channel_binding}
		end;
	    _ -> {error, bad_attribute}
	  end;
      _ -> {error, parser_failed}
    end.

cbind_valid(State, Cbind) ->
    error_logger:error_msg("cbind ~p ~p", [State, Cbind]),
    cbind_valid2(State, Cbind).
cbind_valid2(#state{plus = true}, <<"p=tls-unique">>) ->
    true;
cbind_valid2(#state{plus = true}, _) ->
    false;
cbind_valid2(_, <<"y",_/binary>>) ->
    true;
cbind_valid2(_, <<"n",_/binary>>) ->
    true;
cbind_valid2(_, _) ->
    false.

cbind_verify(State, Cbind) ->
    error_logger:error_msg("cbind4 ~p ~p", [State, Cbind]),
    cbind_verify2(State, Cbind).
cbind_verify2(#state{plus = true, plus_data = Data}, <<"p=tls-unique,,", Data/binary>>) ->
    true;
cbind_verify2(#state{plus = true}, _) ->
    false;
cbind_verify2(_, <<"y", _/binary>>) ->
    true;
cbind_verify2(_, <<"n", _/binary>>) ->
    true;
cbind_verify2(_, _) ->
    false.

parse_attribute(<<Name, $=, Val/binary>>) when Val /= <<>> ->
    case is_alpha(Name) of
	true -> {Name, Val};
	false -> {error, bad_attribute}
    end;
parse_attribute(_) ->
    {error, bad_attribute}.

unescape_username(<<"">>) -> <<"">>;
unescape_username(EscapedUsername) ->
    Pos = str(EscapedUsername, <<"=">>),
    if Pos == 0 -> EscapedUsername;
       true ->
	   Start = substr(EscapedUsername, 1, Pos - 1),
	   End = substr(EscapedUsername, Pos),
	   EndLen = byte_size(End),
	   if EndLen < 3 -> error;
	      true ->
		  case substr(End, 1, 3) of
		    <<"=2C">> ->
			<<Start/binary, ",",
			  (unescape_username(substr(End, 4)))/binary>>;
		    <<"=3D">> ->
			<<Start/binary, "=",
			  (unescape_username(substr(End, 4)))/binary>>;
		    _Else -> error
		  end
	   end
    end.

is_alpha(Char) when Char >= $a, Char =< $z -> true;
is_alpha(Char) when Char >= $A, Char =< $Z -> true;
is_alpha(_) -> false.

-spec str(binary(), binary()) -> non_neg_integer().
str(B1, B2) ->
    case binary:match(B1, B2) of
        {R, _Len} -> R+1;
        _ -> 0
    end.

-spec substr(binary(), pos_integer()) -> binary().
substr(B, N) ->
    binary_part(B, N-1, byte_size(B)-N+1).

-spec substr(binary(), pos_integer(), non_neg_integer()) -> binary().
substr(B, S, E) ->
    binary_part(B, S-1, E).

-spec tokens(binary(), binary()) -> [binary()].
tokens(B1, B2) ->
    [iolist_to_binary(T) ||
        T <- string:tokens(binary_to_list(B1), binary_to_list(B2))].
