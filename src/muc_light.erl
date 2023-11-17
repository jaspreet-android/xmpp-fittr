%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(muc_light).

-compile(export_all).

do_decode(<<"user">>, <<"urn:xmpp:muclight:0#create">>,
          El, Opts) ->
    decode_muc_light_user(<<"urn:xmpp:muclight:0#create">>,
                          Opts,
                          El);
do_decode(<<"user">>,
          <<"urn:xmpp:muclight:0#affiliations">>, El, Opts) ->
    decode_muc_light_user(<<"urn:xmpp:muclight:0#affiliations">>,
                          Opts,
                          El);
do_decode(<<"x">>,
          <<"urn:xmpp:muclight:0#affiliations">>, El, Opts) ->
    decode_muc_light_x(<<"urn:xmpp:muclight:0#affiliations">>,
                       Opts,
                       El);
do_decode(<<"query">>,
          <<"urn:xmpp:muclight:0#affiliations">>, El, Opts) ->
    decode_muc_light_aff(<<"urn:xmpp:muclight:0#affiliations">>,
                         Opts,
                         El);
do_decode(<<"occupants">>,
          <<"urn:xmpp:muclight:0#create">>, El, Opts) ->
    decode_muc_light_occupants(<<"urn:xmpp:muclight:0#create">>,
                               Opts,
                               El);
do_decode(<<"roomname">>,
          <<"urn:xmpp:muclight:0#create">>, El, Opts) ->
    decode_muc_light_roomname(<<"urn:xmpp:muclight:0#create">>,
                              Opts,
                              El);
do_decode(<<"configuration">>,
          <<"urn:xmpp:muclight:0#create">>, El, Opts) ->
    decode_muc_light_configuration(<<"urn:xmpp:muclight:0#create">>,
                                   Opts,
                                   El);
do_decode(<<"query">>, <<"urn:xmpp:muclight:0#create">>,
          El, Opts) ->
    decode_muc_light_create(<<"urn:xmpp:muclight:0#create">>,
                            Opts,
                            El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"user">>, <<"urn:xmpp:muclight:0#create">>},
     {<<"user">>, <<"urn:xmpp:muclight:0#affiliations">>},
     {<<"x">>, <<"urn:xmpp:muclight:0#affiliations">>},
     {<<"query">>, <<"urn:xmpp:muclight:0#affiliations">>},
     {<<"occupants">>, <<"urn:xmpp:muclight:0#create">>},
     {<<"roomname">>, <<"urn:xmpp:muclight:0#create">>},
     {<<"configuration">>, <<"urn:xmpp:muclight:0#create">>},
     {<<"query">>, <<"urn:xmpp:muclight:0#create">>}].

do_encode({muc_light_create, _, _} = Query, TopXMLNS) ->
    encode_muc_light_create(Query, TopXMLNS);
do_encode({muc_light_configuration, _} = Configuration,
          TopXMLNS) ->
    encode_muc_light_configuration(Configuration, TopXMLNS);
do_encode({roomname, _} = Roomname, TopXMLNS) ->
    encode_muc_light_roomname(Roomname, TopXMLNS);
do_encode({muc_light_occupants, _} = Occupants,
          TopXMLNS) ->
    encode_muc_light_occupants(Occupants, TopXMLNS);
do_encode({muc_light_aff, _} = Query, TopXMLNS) ->
    encode_muc_light_aff(Query, TopXMLNS);
do_encode({muc_light_x, _} = X, TopXMLNS) ->
    encode_muc_light_x(X, TopXMLNS);
do_encode({muc_light_user, _, _} = User, TopXMLNS) ->
    encode_muc_light_user(User, TopXMLNS).

do_get_name({muc_light_aff, _}) -> <<"query">>;
do_get_name({muc_light_configuration, _}) ->
    <<"configuration">>;
do_get_name({muc_light_create, _, _}) -> <<"query">>;
do_get_name({muc_light_occupants, _}) ->
    <<"occupants">>;
do_get_name({muc_light_user, _, _}) -> <<"user">>;
do_get_name({muc_light_x, _}) -> <<"x">>;
do_get_name({roomname, _}) -> <<"roomname">>.

do_get_ns({muc_light_aff, _}) ->
    <<"urn:xmpp:muclight:0#affiliations">>;
do_get_ns({muc_light_configuration, _}) ->
    <<"urn:xmpp:muclight:0#create">>;
do_get_ns({muc_light_create, _, _}) ->
    <<"urn:xmpp:muclight:0#create">>;
do_get_ns({muc_light_occupants, _}) ->
    <<"urn:xmpp:muclight:0#create">>;
do_get_ns({muc_light_user, _, _}) ->
    <<"urn:xmpp:muclight:0#create">>;
do_get_ns({muc_light_x, _}) ->
    <<"urn:xmpp:muclight:0#affiliations">>;
do_get_ns({roomname, _}) ->
    <<"urn:xmpp:muclight:0#create">>.

pp(muc_light_create, 2) -> [configuration, occupants];
pp(muc_light_configuration, 1) -> [roomname];
pp(roomname, 1) -> [roomname];
pp(muc_light_occupants, 1) -> [users];
pp(muc_light_aff, 1) -> [users];
pp(muc_light_x, 1) -> [users];
pp(muc_light_user, 2) -> [affiliation, muc_light_user];
pp(_, _) -> no.

records() ->
    [{muc_light_create, 2},
     {muc_light_configuration, 1},
     {roomname, 1},
     {muc_light_occupants, 1},
     {muc_light_aff, 1},
     {muc_light_x, 1},
     {muc_light_user, 2}].

decode_muc_light_user(__TopXMLNS, __Opts,
                      {xmlel, <<"user">>, _attrs, _els}) ->
    Muc_light_user = decode_muc_light_user_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               <<>>),
    Affiliation = decode_muc_light_user_attrs(__TopXMLNS,
                                              _attrs,
                                              undefined),
    {muc_light_user, Affiliation, Muc_light_user}.

decode_muc_light_user_els(__TopXMLNS, __Opts, [],
                          Muc_light_user) ->
    decode_muc_light_user_cdata(__TopXMLNS, Muc_light_user);
decode_muc_light_user_els(__TopXMLNS, __Opts,
                          [{xmlcdata, _data} | _els], Muc_light_user) ->
    decode_muc_light_user_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<Muc_light_user/binary, _data/binary>>);
decode_muc_light_user_els(__TopXMLNS, __Opts,
                          [_ | _els], Muc_light_user) ->
    decode_muc_light_user_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Muc_light_user).

decode_muc_light_user_attrs(__TopXMLNS,
                            [{<<"affiliation">>, _val} | _attrs],
                            _Affiliation) ->
    decode_muc_light_user_attrs(__TopXMLNS, _attrs, _val);
decode_muc_light_user_attrs(__TopXMLNS, [_ | _attrs],
                            Affiliation) ->
    decode_muc_light_user_attrs(__TopXMLNS,
                                _attrs,
                                Affiliation);
decode_muc_light_user_attrs(__TopXMLNS, [],
                            Affiliation) ->
    decode_muc_light_user_attr_affiliation(__TopXMLNS,
                                           Affiliation).

encode_muc_light_user({muc_light_user,
                       Affiliation,
                       Muc_light_user},
                      __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:muclight:0#create">>,
                                                 <<"urn:xmpp:muclight:0#affiliations">>],
                                                __TopXMLNS),
    _els = encode_muc_light_user_cdata(Muc_light_user, []),
    _attrs =
        encode_muc_light_user_attr_affiliation(Affiliation,
                                               xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                          __TopXMLNS)),
    {xmlel, <<"user">>, _attrs, _els}.

decode_muc_light_user_attr_affiliation(__TopXMLNS,
                                       undefined) ->
    <<>>;
decode_muc_light_user_attr_affiliation(__TopXMLNS,
                                       _val) ->
    _val.

encode_muc_light_user_attr_affiliation(<<>>, _acc) ->
    _acc;
encode_muc_light_user_attr_affiliation(_val, _acc) ->
    [{<<"affiliation">>, _val} | _acc].

decode_muc_light_user_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"user">>, __TopXMLNS}});
decode_muc_light_user_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"user">>, __TopXMLNS}});
        _res -> _res
    end.

encode_muc_light_user_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_muc_light_x(__TopXMLNS, __Opts,
                   {xmlel, <<"x">>, _attrs, _els}) ->
    Users = decode_muc_light_x_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   []),
    {muc_light_x, Users}.

decode_muc_light_x_els(__TopXMLNS, __Opts, [], Users) ->
    lists:reverse(Users);
decode_muc_light_x_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"user">>, _attrs, _} = _el | _els], Users) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:muclight:0#create">> ->
            decode_muc_light_x_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   [decode_muc_light_user(<<"urn:xmpp:muclight:0#create">>,
                                                          __Opts,
                                                          _el)
                                    | Users]);
        <<"urn:xmpp:muclight:0#affiliations">> ->
            decode_muc_light_x_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   [decode_muc_light_user(<<"urn:xmpp:muclight:0#affiliations">>,
                                                          __Opts,
                                                          _el)
                                    | Users]);
        _ ->
            decode_muc_light_x_els(__TopXMLNS, __Opts, _els, Users)
    end;
decode_muc_light_x_els(__TopXMLNS, __Opts, [_ | _els],
                       Users) ->
    decode_muc_light_x_els(__TopXMLNS, __Opts, _els, Users).

encode_muc_light_x({muc_light_x, Users}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:muclight:0#affiliations">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_muc_light_x_$users'(Users,
                                                     __NewTopXMLNS,
                                                     [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"x">>, _attrs, _els}.

'encode_muc_light_x_$users'([], __TopXMLNS, _acc) ->
    _acc;
'encode_muc_light_x_$users'([Users | _els], __TopXMLNS,
                            _acc) ->
    'encode_muc_light_x_$users'(_els,
                                __TopXMLNS,
                                [encode_muc_light_user(Users, __TopXMLNS)
                                 | _acc]).

decode_muc_light_aff(__TopXMLNS, __Opts,
                     {xmlel, <<"query">>, _attrs, _els}) ->
    Users = decode_muc_light_aff_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     []),
    {muc_light_aff, Users}.

decode_muc_light_aff_els(__TopXMLNS, __Opts, [],
                         Users) ->
    lists:reverse(Users);
decode_muc_light_aff_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"user">>, _attrs, _} = _el | _els],
                         Users) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:muclight:0#create">> ->
            decode_muc_light_aff_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     [decode_muc_light_user(<<"urn:xmpp:muclight:0#create">>,
                                                            __Opts,
                                                            _el)
                                      | Users]);
        <<"urn:xmpp:muclight:0#affiliations">> ->
            decode_muc_light_aff_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     [decode_muc_light_user(<<"urn:xmpp:muclight:0#affiliations">>,
                                                            __Opts,
                                                            _el)
                                      | Users]);
        _ ->
            decode_muc_light_aff_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Users)
    end;
decode_muc_light_aff_els(__TopXMLNS, __Opts, [_ | _els],
                         Users) ->
    decode_muc_light_aff_els(__TopXMLNS,
                             __Opts,
                             _els,
                             Users).

encode_muc_light_aff({muc_light_aff, Users},
                     __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:muclight:0#affiliations">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_muc_light_aff_$users'(Users,
                                                    __NewTopXMLNS,
                                                    [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_muc_light_aff_$users'([], __TopXMLNS, _acc) ->
    _acc;
'encode_muc_light_aff_$users'([Users | _els],
                              __TopXMLNS, _acc) ->
    'encode_muc_light_aff_$users'(_els,
                                  __TopXMLNS,
                                  [encode_muc_light_user(Users, __TopXMLNS)
                                   | _acc]).

decode_muc_light_occupants(__TopXMLNS, __Opts,
                           {xmlel, <<"occupants">>, _attrs, _els}) ->
    Users = decode_muc_light_occupants_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           []),
    {muc_light_occupants, Users}.

decode_muc_light_occupants_els(__TopXMLNS, __Opts, [],
                               Users) ->
    lists:reverse(Users);
decode_muc_light_occupants_els(__TopXMLNS, __Opts,
                               [{xmlel, <<"user">>, _attrs, _} = _el | _els],
                               Users) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:muclight:0#create">> ->
            decode_muc_light_occupants_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           [decode_muc_light_user(<<"urn:xmpp:muclight:0#create">>,
                                                                  __Opts,
                                                                  _el)
                                            | Users]);
        <<"urn:xmpp:muclight:0#affiliations">> ->
            decode_muc_light_occupants_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           [decode_muc_light_user(<<"urn:xmpp:muclight:0#affiliations">>,
                                                                  __Opts,
                                                                  _el)
                                            | Users]);
        _ ->
            decode_muc_light_occupants_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           Users)
    end;
decode_muc_light_occupants_els(__TopXMLNS, __Opts,
                               [_ | _els], Users) ->
    decode_muc_light_occupants_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Users).

encode_muc_light_occupants({muc_light_occupants, Users},
                           __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:muclight:0#create">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_muc_light_occupants_$users'(Users,
                                                          __NewTopXMLNS,
                                                          [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"occupants">>, _attrs, _els}.

'encode_muc_light_occupants_$users'([], __TopXMLNS,
                                    _acc) ->
    _acc;
'encode_muc_light_occupants_$users'([Users | _els],
                                    __TopXMLNS, _acc) ->
    'encode_muc_light_occupants_$users'(_els,
                                        __TopXMLNS,
                                        [encode_muc_light_user(Users,
                                                               __TopXMLNS)
                                         | _acc]).

decode_muc_light_roomname(__TopXMLNS, __Opts,
                          {xmlel, <<"roomname">>, _attrs, _els}) ->
    Roomname = decode_muc_light_roomname_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             <<>>),
    {roomname, Roomname}.

decode_muc_light_roomname_els(__TopXMLNS, __Opts, [],
                              Roomname) ->
    decode_muc_light_roomname_cdata(__TopXMLNS, Roomname);
decode_muc_light_roomname_els(__TopXMLNS, __Opts,
                              [{xmlcdata, _data} | _els], Roomname) ->
    decode_muc_light_roomname_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<Roomname/binary, _data/binary>>);
decode_muc_light_roomname_els(__TopXMLNS, __Opts,
                              [_ | _els], Roomname) ->
    decode_muc_light_roomname_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Roomname).

encode_muc_light_roomname({roomname, Roomname},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:muclight:0#create">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_muc_light_roomname_cdata(Roomname, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"roomname">>, _attrs, _els}.

decode_muc_light_roomname_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"roomname">>, __TopXMLNS}});
decode_muc_light_roomname_cdata(__TopXMLNS, _val) ->
    _val.

encode_muc_light_roomname_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_muc_light_configuration(__TopXMLNS, __Opts,
                               {xmlel, <<"configuration">>, _attrs, _els}) ->
    Roomname =
        decode_muc_light_configuration_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           []),
    {muc_light_configuration, Roomname}.

decode_muc_light_configuration_els(__TopXMLNS, __Opts,
                                   [], Roomname) ->
    lists:reverse(Roomname);
decode_muc_light_configuration_els(__TopXMLNS, __Opts,
                                   [{xmlel, <<"roomname">>, _attrs, _} = _el
                                    | _els],
                                   Roomname) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:muclight:0#create">> ->
            decode_muc_light_configuration_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               [decode_muc_light_roomname(<<"urn:xmpp:muclight:0#create">>,
                                                                          __Opts,
                                                                          _el)
                                                | Roomname]);
        _ ->
            decode_muc_light_configuration_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               Roomname)
    end;
decode_muc_light_configuration_els(__TopXMLNS, __Opts,
                                   [_ | _els], Roomname) ->
    decode_muc_light_configuration_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Roomname).

encode_muc_light_configuration({muc_light_configuration,
                                Roomname},
                               __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:muclight:0#create">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_muc_light_configuration_$roomname'(Roomname,
                                                                 __NewTopXMLNS,
                                                                 [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"configuration">>, _attrs, _els}.

'encode_muc_light_configuration_$roomname'([],
                                           __TopXMLNS, _acc) ->
    _acc;
'encode_muc_light_configuration_$roomname'([Roomname
                                            | _els],
                                           __TopXMLNS, _acc) ->
    'encode_muc_light_configuration_$roomname'(_els,
                                               __TopXMLNS,
                                               [encode_muc_light_roomname(Roomname,
                                                                          __TopXMLNS)
                                                | _acc]).

decode_muc_light_create(__TopXMLNS, __Opts,
                        {xmlel, <<"query">>, _attrs, _els}) ->
    {Occupants, Configuration} =
        decode_muc_light_create_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    [],
                                    []),
    {muc_light_create, Configuration, Occupants}.

decode_muc_light_create_els(__TopXMLNS, __Opts, [],
                            Occupants, Configuration) ->
    {lists:reverse(Occupants),
     lists:reverse(Configuration)};
decode_muc_light_create_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"configuration">>, _attrs, _} = _el
                             | _els],
                            Occupants, Configuration) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:muclight:0#create">> ->
            decode_muc_light_create_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Occupants,
                                        [decode_muc_light_configuration(<<"urn:xmpp:muclight:0#create">>,
                                                                        __Opts,
                                                                        _el)
                                         | Configuration]);
        _ ->
            decode_muc_light_create_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Occupants,
                                        Configuration)
    end;
decode_muc_light_create_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"occupants">>, _attrs, _} = _el | _els],
                            Occupants, Configuration) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:muclight:0#create">> ->
            decode_muc_light_create_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        [decode_muc_light_occupants(<<"urn:xmpp:muclight:0#create">>,
                                                                    __Opts,
                                                                    _el)
                                         | Occupants],
                                        Configuration);
        _ ->
            decode_muc_light_create_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Occupants,
                                        Configuration)
    end;
decode_muc_light_create_els(__TopXMLNS, __Opts,
                            [_ | _els], Occupants, Configuration) ->
    decode_muc_light_create_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Occupants,
                                Configuration).

encode_muc_light_create({muc_light_create,
                         Configuration,
                         Occupants},
                        __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:muclight:0#create">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_muc_light_create_$occupants'(Occupants,
                                                           __NewTopXMLNS,
                                                           'encode_muc_light_create_$configuration'(Configuration,
                                                                                                    __NewTopXMLNS,
                                                                                                    []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_muc_light_create_$occupants'([], __TopXMLNS,
                                     _acc) ->
    _acc;
'encode_muc_light_create_$occupants'([Occupants | _els],
                                     __TopXMLNS, _acc) ->
    'encode_muc_light_create_$occupants'(_els,
                                         __TopXMLNS,
                                         [encode_muc_light_occupants(Occupants,
                                                                     __TopXMLNS)
                                          | _acc]).

'encode_muc_light_create_$configuration'([], __TopXMLNS,
                                         _acc) ->
    _acc;
'encode_muc_light_create_$configuration'([Configuration
                                          | _els],
                                         __TopXMLNS, _acc) ->
    'encode_muc_light_create_$configuration'(_els,
                                             __TopXMLNS,
                                             [encode_muc_light_configuration(Configuration,
                                                                             __TopXMLNS)
                                              | _acc]).
