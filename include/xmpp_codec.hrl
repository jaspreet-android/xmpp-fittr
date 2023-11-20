%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-record(text, {lang = <<>> :: binary(),
               data = <<>> :: binary()}).
-type text() :: #text{}.

-type iq_type() :: get | set | result | error.
-type message_type() :: chat | error | groupchat | headline | normal.
-type presence_type() :: available | error | probe | subscribe |
			 subscribed | unavailable | unsubscribe |
			 unsubscribed.

-record(iq, {id = <<>> :: binary(),
             type :: iq_type(),
             lang = <<>> :: binary(),
             from :: undefined | jid:jid(),
             from_jid :: undefined | jid:jid(),
             to :: undefined | jid:jid(),
             sub_els = [] :: [xmpp_element() | fxml:xmlel()],
	     meta = #{} :: map()}).
-type iq() :: #iq{}.

-record(message, {id = <<>> :: binary(),
                  type = normal :: message_type(),
                  lang = <<>> :: binary(),
                  from :: undefined | jid:jid(),
                  to :: undefined | jid:jid(),
                  subject = [] :: [#text{}],
                  body = [] :: [#text{}],
                  thread :: undefined | message_thread(),
                  sub_els = [] :: [xmpp_element() | fxml:xmlel()],
		  meta = #{} :: map()}).
-type message() :: #message{}.

-record(presence, {id = <<>> :: binary(),
                   type = available :: presence_type(),
                   lang = <<>> :: binary(),
                   from :: undefined | jid:jid(),
                   to :: undefined | jid:jid(),
                   show :: undefined | 'away' | 'chat' | 'dnd' | 'xa',
                   status = [] :: [#text{}],
                   priority :: undefined | integer(),
                   sub_els = [] :: [xmpp_element() | fxml:xmlel()],
		   meta = #{} :: map()}).
-type presence() :: #presence{}.

-record(ps_affiliation, {xmlns = <<>> :: binary(),
			 node = <<>> :: binary(),
			 type :: member | none | outcast |
				 owner | publisher | publish_only,
			 jid :: undefined | jid:jid()}).
-type ps_affiliation() :: #ps_affiliation{}.

-type ps_error_type() :: 'closed-node' | 'configuration-required' |
			 'invalid-jid' | 'invalid-options' |
			 'invalid-payload' | 'invalid-subid' |
			 'item-forbidden' | 'item-required' | 'jid-required' |
			 'max-items-exceeded' | 'max-nodes-exceeded' |
			 'nodeid-required' | 'not-in-roster-group' |
			 'not-subscribed' | 'payload-too-big' |
			 'payload-required' | 'pending-subscription' |
			 'precondition-not-met' |
			 'presence-subscription-required' | 'subid-required' |
			 'too-many-subscriptions' | 'unsupported' |
			 'unsupported-access-model'.
-type ps_feature() :: 'access-authorize' | 'access-open' |
		      'access-presence' | 'access-roster' |
		      'access-whitelist' | 'auto-create' |
		      'auto-subscribe' | 'collections' | 'config-node' |
		      'create-and-configure' | 'create-nodes' |
		      'delete-items' | 'delete-nodes' |
		      'filtered-notifications' | 'get-pending' |
		      'instant-nodes' | 'item-ids' | 'last-published' |
		      'leased-subscription' | 'manage-subscriptions' |
		      'member-affiliation' | 'meta-data' |
		      'modify-affiliations' | 'multi-collection' |
		      'multi-subscribe' | 'outcast-affiliation' |
		      'persistent-items' | 'presence-notifications' |
		      'presence-subscribe' | 'publish' |
		      'publish-options' | 'publish-only-affiliation' |
		      'publisher-affiliation' | 'purge-nodes' |
		      'retract-items' | 'retrieve-affiliations' |
		      'retrieve-default' | 'retrieve-items' |
		      'retrieve-subscriptions' | 'subscribe' |
		      'subscription-options' | 'subscription-notifications' |
		      'multi-items' | undefined.
-record(ps_error, {type :: ps_error_type(), feature :: ps_feature()}).
-type ps_error() :: #ps_error{}.

-record(chatstate, {type :: active | composing | gone | inactive | paused}).
-type chatstate() :: #chatstate{}.

-record(csi, {type :: active | inactive}).
-type csi() :: #csi{}.

-record(hint, {type :: 'no-copy' | 'no-store' | 'no-storage' | 'store' |
		       'no-permanent-store' | 'no-permanent-storage'}).
-type hint() :: #hint{}.

-record(jingle_error, {reason :: 'out-of-order' | 'tie-break' |
				 'unknown-session' | 'unsupported-info' |
				 'security-required'}).
-type jingle_error() :: #jingle_error{}.

-record(jingle_ft_error, {reason :: 'file-not-available' | 'file-too-large'}).
-type jingle_ft_error() :: #jingle_ft_error{}.

-type xmpp_host() :: binary() | inet:ip_address() |
		     {binary() | inet:ip_address(), inet:port_number()}.

-record(timestampmsg, {id = <<>> :: binary(),
                       time = <<>> :: binary()}).
-type timestampmsg() :: #timestampmsg{}.

-record(avatar_data, {data = <<>> :: binary()}).
-type avatar_data() :: #avatar_data{}.

-record(feature_register, {}).
-type feature_register() :: #feature_register{}.

-record(address, {type :: 'bcc' | 'cc' | 'noreply' | 'ofrom' | 'replyroom' | 'replyto' | 'to',
                  jid :: undefined | jid:jid(),
                  desc = <<>> :: binary(),
                  node = <<>> :: binary(),
                  delivered :: 'false' | 'true' | 'undefined',
                  sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type address() :: #address{}.

-record(sasl_success, {text = <<>> :: binary()}).
-type sasl_success() :: #sasl_success{}.

-record(media_call_activities, {type = <<>> :: binary(),
                                status = <<>> :: binary(),
                                call_status = <<>> :: binary(),
                                start_time = <<>> :: binary(),
                                call_mode = <<>> :: binary(),
                                call_from = <<>> :: binary(),
                                call_time = <<>> :: binary(),
                                call_type = <<>> :: binary(),
                                end_time = <<>> :: binary(),
                                room_id = <<>> :: binary(),
                                group_id = <<>> :: binary(),
                                profile_name = <<>> :: binary(),
                                nick_name = <<>> :: binary(),
                                result_type = <<>> :: binary(),
                                sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type media_call_activities() :: #media_call_activities{}.

-record(user_activities, {remove_user = <<>> :: binary(),
                          type = <<>> :: binary(),
                          result_type = <<>> :: binary(),
                          status = <<>> :: binary(),
                          password = <<>> :: binary(),
                          socket_id = <<>> :: binary(),
                          message_from = <<>> :: binary(),
                          message_to = <<>> :: binary(),
                          to_user = <<>> :: binary(),
                          mode = <<>> :: binary(),
                          message_id = <<>> :: binary(),
                          message_ids = <<>> :: binary(),
                          chat_type = <<>> :: binary(),
                          reply_id = <<>> :: binary(),
                          delete_type = <<>> :: binary(),
                          favourite = <<>> :: binary(),
                          sub_els = [] :: [xmpp_element() | fxml:xmlel()],
                          position = <<>> :: binary(),
                          limit = <<>> :: binary(),
                          page = <<>> :: binary(),
                          timestamp = <<>> :: binary(),
                          prefetch = <<>> :: binary(),
                          call_status = <<>> :: binary(),
                          call_type = <<>> :: binary(),
                          caller_device = <<>> :: binary(),
                          call_id = <<>> :: binary(),
                          call_attend_status = <<>> :: binary(),
                          has_more_message = <<>> :: binary()}).
-type user_activities() :: #user_activities{}.

-record(adhoc_note, {type = info :: 'error' | 'info' | 'warn',
                     data = <<>> :: binary()}).
-type adhoc_note() :: #adhoc_note{}.

-record(mam_result, {xmlns = <<>> :: binary(),
                     queryid = <<>> :: binary(),
                     id = <<>> :: binary(),
                     sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type mam_result() :: #mam_result{}.

-record(rsm_first, {index :: 'undefined' | non_neg_integer(),
                    data = <<>> :: binary()}).
-type rsm_first() :: #rsm_first{}.

-record(streamhost, {jid :: jid:jid(),
                     host = <<>> :: binary(),
                     port = 1080 :: non_neg_integer()}).
-type streamhost() :: #streamhost{}.

-record(logout, {type = <<>> :: binary()}).
-type logout() :: #logout{}.

-record(participant, {result_type = <<>> :: binary()}).
-type participant() :: #participant{}.

-record(x509_challenge_failed, {}).
-type x509_challenge_failed() :: #x509_challenge_failed{}.

-record(mark_displayed, {id = <<>> :: binary()}).
-type mark_displayed() :: #mark_displayed{}.

-record(mark_acknowledged, {id = <<>> :: binary()}).
-type mark_acknowledged() :: #mark_acknowledged{}.

-record(mark_received, {id = <<>> :: binary()}).
-type mark_received() :: #mark_received{}.

-record(carbons_enable, {}).
-type carbons_enable() :: #carbons_enable{}.

-record(mix_create, {channel = <<>> :: binary(),
                     xmlns = <<>> :: binary()}).
-type mix_create() :: #mix_create{}.

-record(receipt_response, {id = <<>> :: binary()}).
-type receipt_response() :: #receipt_response{}.

-record(expire, {seconds :: non_neg_integer(),
                 stored :: 'undefined' | non_neg_integer()}).
-type expire() :: #expire{}.

-record(acknowledge, {broadcast_msgid = <<>> :: binary(),
                      type = <<>> :: binary(),
                      id = <<>> :: binary(),
                      sent_to = <<>> :: binary()}).
-type acknowledge() :: #acknowledge{}.

-record(roomname, {roomname = <<>> :: binary()}).
-type roomname() :: #roomname{}.

-record(mix_leave, {xmlns = <<>> :: binary()}).
-type mix_leave() :: #mix_leave{}.

-record(profile_update, {vcard = <<>> :: binary()}).
-type profile_update() :: #profile_update{}.

-record(muc_unsubscribe, {nick = <<>> :: binary(),
                          jid :: undefined | jid:jid()}).
-type muc_unsubscribe() :: #muc_unsubscribe{}.

-record(ps_unsubscribe, {node = <<>> :: binary(),
                         jid :: jid:jid(),
                         subid = <<>> :: binary()}).
-type ps_unsubscribe() :: #ps_unsubscribe{}.

-record(sm_resume, {h :: non_neg_integer(),
                    previd = <<>> :: binary(),
                    xmlns = <<>> :: binary()}).
-type sm_resume() :: #sm_resume{}.

-record(carbons_private, {}).
-type carbons_private() :: #carbons_private{}.

-record(user_fav, {to_user = <<>> :: binary(),
                   message_id = <<>> :: binary(),
                   chat_type = <<>> :: binary(),
                   status = <<>> :: binary(),
                   result_type = <<>> :: binary(),
                   type = <<>> :: binary(),
                   sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type user_fav() :: #user_fav{}.

-record(ping, {}).
-type ping() :: #ping{}.

-record(delay, {stamp :: erlang:timestamp(),
                from :: undefined | jid:jid(),
                desc = <<>> :: binary()}).
-type delay() :: #delay{}.

-record(muc_history, {maxchars :: 'undefined' | non_neg_integer(),
                      maxstanzas :: 'undefined' | non_neg_integer(),
                      seconds :: 'undefined' | non_neg_integer(),
                      since :: undefined | erlang:timestamp()}).
-type muc_history() :: #muc_history{}.

-record(thumbnail, {uri = <<>> :: binary(),
                    'media-type' = <<>> :: binary(),
                    width :: 'undefined' | non_neg_integer(),
                    height :: 'undefined' | non_neg_integer()}).
-type thumbnail() :: #thumbnail{}.

-record(privilege_perm, {access :: 'message' | 'presence' | 'roster',
                         type :: 'both' | 'get' | 'managed_entity' | 'none' | 'outgoing' | 'roster' | 'set'}).
-type privilege_perm() :: #privilege_perm{}.

-record(ibb_open, {sid = <<>> :: binary(),
                   'block-size' :: non_neg_integer(),
                   stanza = iq :: 'iq' | 'message'}).
-type ibb_open() :: #ibb_open{}.

-record(muc_light_configuration, {roomname = [] :: [#roomname{}]}).
-type muc_light_configuration() :: #muc_light_configuration{}.

-record(roster_notification, {roster_notification = <<>> :: binary()}).
-type roster_notification() :: #roster_notification{}.

-record(muc_decline, {reason = <<>> :: binary(),
                      from :: undefined | jid:jid(),
                      to :: undefined | jid:jid()}).
-type muc_decline() :: #muc_decline{}.

-record(upload_slot_0, {get :: binary(),
                        put :: binary(),
                        xmlns = <<>> :: binary()}).
-type upload_slot_0() :: #upload_slot_0{}.

-record(upload_request_0, {filename = <<>> :: binary(),
                           size :: pos_integer(),
                           'content-type' = <<>> :: binary(),
                           xmlns = <<>> :: binary()}).
-type upload_request_0() :: #upload_request_0{}.

-record(sm_a, {h :: non_neg_integer(),
               xmlns = <<>> :: binary()}).
-type sm_a() :: #sm_a{}.

-record(ibb_data, {sid = <<>> :: binary(),
                   seq :: non_neg_integer(),
                   data = <<>> :: binary()}).
-type ibb_data() :: #ibb_data{}.

-record(buser, {result_type = <<>> :: binary()}).
-type buser() :: #buser{}.

-record(x509_csr, {name = <<>> :: binary(),
                   der = <<>> :: binary()}).
-type x509_csr() :: #x509_csr{}.

-record(muc_light_user, {affiliation = <<>> :: binary(),
                         muc_light_user :: jid:jid()}).
-type muc_light_user() :: #muc_light_user{}.

-record(muc_light_x, {users = [] :: [#muc_light_user{}]}).
-type muc_light_x() :: #muc_light_x{}.

-record(muc_light_aff, {users = [] :: [#muc_light_user{}]}).
-type muc_light_aff() :: #muc_light_aff{}.

-record(participants, {participant = [] :: [#participant{}]}).
-type participants() :: #participants{}.

-record(roster_status, {roster_status = <<>> :: binary()}).
-type roster_status() :: #roster_status{}.

-record(jingle_ft_received, {creator :: 'initiator' | 'responder' | 'undefined',
                             name = <<>> :: binary()}).
-type jingle_ft_received() :: #jingle_ft_received{}.

-record(starttls_proceed, {}).
-type starttls_proceed() :: #starttls_proceed{}.

-record(sm_resumed, {h :: non_neg_integer(),
                     previd = <<>> :: binary(),
                     xmlns = <<>> :: binary()}).
-type sm_resumed() :: #sm_resumed{}.

-record(vcard_emailid, {vcard_email = <<>> :: binary()}).
-type vcard_emailid() :: #vcard_emailid{}.

-record(x509_request, {transaction = <<>> :: binary(),
                       csr :: #x509_csr{},
                       cert :: 'undefined' | binary(),
                       signature :: 'undefined' | binary()}).
-type x509_request() :: #x509_request{}.

-record(stream_start, {from :: undefined | jid:jid(),
                       to :: undefined | jid:jid(),
                       id = <<>> :: binary(),
                       version :: 'undefined' | {non_neg_integer(),non_neg_integer()},
                       xmlns = <<>> :: binary(),
                       stream_xmlns = <<>> :: binary(),
                       db_xmlns = <<>> :: binary(),
                       lang = <<>> :: binary()}).
-type stream_start() :: #stream_start{}.

-record(muc_subscribe, {nick = <<>> :: binary(),
                        password = <<>> :: binary(),
                        jid :: undefined | jid:jid(),
                        events = [] :: [binary()]}).
-type muc_subscribe() :: #muc_subscribe{}.

-record(jingle_ibb_transport, {sid = <<>> :: binary(),
                               'block-size' :: non_neg_integer(),
                               stanza = iq :: 'iq' | 'message'}).
-type jingle_ibb_transport() :: #jingle_ibb_transport{}.

-record(stanza_id, {by :: jid:jid(),
                    id = <<>> :: binary()}).
-type stanza_id() :: #stanza_id{}.

-record(forwarded, {delay :: 'undefined' | #delay{},
                    sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type forwarded() :: #forwarded{}.

-record(privilege, {perms = [] :: [#privilege_perm{}],
                    forwarded :: 'undefined' | #forwarded{}}).
-type privilege() :: #privilege{}.

-record(message_thread, {parent = <<>> :: binary(),
                         data = <<>> :: binary()}).
-type message_thread() :: #message_thread{}.

-record(jingle_content, {creator :: 'initiator' | 'responder',
                         disposition = <<>> :: binary(),
                         name = <<>> :: binary(),
                         senders = both :: 'both' | 'initiator' | 'none' | 'responder',
                         sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type jingle_content() :: #jingle_content{}.

-record(group_participant, {result_type = <<>> :: binary()}).
-type group_participant() :: #group_participant{}.

-record(broadcastid, {result_type = <<>> :: binary()}).
-type broadcastid() :: #broadcastid{}.

-record(handshake, {data = <<>> :: binary()}).
-type handshake() :: #handshake{}.

-record(roster_name, {roster_name = <<>> :: binary()}).
-type roster_name() :: #roster_name{}.

-record(db_feature, {errors = false :: boolean()}).
-type db_feature() :: #db_feature{}.

-record(x_conference, {jid :: jid:jid(),
                       password = <<>> :: binary(),
                       reason = <<>> :: binary(),
                       continue :: 'false' | 'true' | 'undefined',
                       thread = <<>> :: binary()}).
-type x_conference() :: #x_conference{}.

-record(private, {sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type private() :: #private{}.

-record(ibb_close, {sid = <<>> :: binary()}).
-type ibb_close() :: #ibb_close{}.

-record(sm_enable, {max :: 'undefined' | non_neg_integer(),
                    resume = false :: boolean(),
                    xmlns = <<>> :: binary()}).
-type sm_enable() :: #sm_enable{}.

-record(roster_image, {roster_image = <<>> :: binary()}).
-type roster_image() :: #roster_image{}.

-record(roster_nickname, {roster_nickname = <<>> :: binary()}).
-type roster_nickname() :: #roster_nickname{}.

-record(vcard_image, {vcard_image = <<>> :: binary()}).
-type vcard_image() :: #vcard_image{}.

-record(starttls_failure, {}).
-type starttls_failure() :: #starttls_failure{}.

-record(gone, {uri = <<>> :: binary()}).
-type gone() :: #gone{}.

-record(sasl_challenge, {text = <<>> :: binary()}).
-type sasl_challenge() :: #sasl_challenge{}.

-record(vcard_coverimg, {vcard_coverimg = <<>> :: binary()}).
-type vcard_coverimg() :: #vcard_coverimg{}.

-record(hash, {algo = <<>> :: binary(),
               data = <<>> :: binary()}).
-type hash() :: #hash{}.

-record(jingle_ft_range, {offset = 0 :: non_neg_integer(),
                          length :: 'undefined' | non_neg_integer(),
                          hash = [] :: [#hash{}]}).
-type jingle_ft_range() :: #jingle_ft_range{}.

-record(delegation_query, {to :: jid:jid(),
                           delegate = [] :: [binary()]}).
-type delegation_query() :: #delegation_query{}.

-record(db_verify, {from = <<>> :: binary(),
                    to = <<>> :: binary(),
                    id = <<>> :: binary(),
                    type :: 'error' | 'invalid' | 'undefined' | 'valid',
                    key = <<>> :: binary(),
                    sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type db_verify() :: #db_verify{}.

-record(muc_light_destroy, {xmlns = <<>> :: binary()}).
-type muc_light_destroy() :: #muc_light_destroy{}.

-record(nick, {name = <<>> :: binary()}).
-type nick() :: #nick{}.

-record(mediacall, {call_mode = <<>> :: binary(),
                    call_time = <<>> :: binary(),
                    call_from = <<>> :: binary(),
                    call_type = <<>> :: binary(),
                    room_id = <<>> :: binary(),
                    group_id = <<>> :: binary()}).
-type mediacall() :: #mediacall{}.

-record(feature_sm, {xmlns = <<>> :: binary()}).
-type feature_sm() :: #feature_sm{}.

-record(ps_item, {xmlns = <<>> :: binary(),
                  id = <<>> :: binary(),
                  sub_els = [] :: [xmpp_element() | fxml:xmlel()],
                  node = <<>> :: binary(),
                  publisher = <<>> :: binary(),
                  usernick = <<>> :: binary(),
                  sendernick = <<>> :: binary()}).
-type ps_item() :: #ps_item{}.

-record(ps_publish, {node = <<>> :: binary(),
                     items = [] :: [#ps_item{}]}).
-type ps_publish() :: #ps_publish{}.

-record(group_subscription, {result_type = <<>> :: binary(),
                             node = <<>> :: binary()}).
-type group_subscription() :: #group_subscription{}.

-record(group_subscriptions, {subscription = [] :: [#group_subscription{}]}).
-type group_subscriptions() :: #group_subscriptions{}.

-record(reaction, {msgid = <<>> :: binary(),
                   from_user = <<>> :: binary(),
                   sender_name = <<>> :: binary(),
                   message_type = <<>> :: binary(),
                   chat_type = <<>> :: binary(),
                   group_jid = <<>> :: binary(),
                   timestamp = <<>> :: binary(),
                   result_type = <<>> :: binary()}).
-type reaction() :: #reaction{}.

-record(avatar_pointer, {bytes :: 'undefined' | non_neg_integer(),
                         id = <<>> :: binary(),
                         type = <<>> :: binary(),
                         height :: 'undefined' | non_neg_integer(),
                         width :: 'undefined' | non_neg_integer(),
                         sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type avatar_pointer() :: #avatar_pointer{}.

-record(sm_r, {xmlns = <<>> :: binary()}).
-type sm_r() :: #sm_r{}.

-record(muc_actor, {jid :: undefined | jid:jid(),
                    nick = <<>> :: binary()}).
-type muc_actor() :: #muc_actor{}.

-record(stat_error, {code :: integer(),
                     reason = <<>> :: binary()}).
-type stat_error() :: #stat_error{}.

-record(stat, {name = <<>> :: binary(),
               units = <<>> :: binary(),
               value = <<>> :: binary(),
               error :: 'undefined' | #stat_error{}}).
-type stat() :: #stat{}.

-record(muc_light_occupants, {users = [] :: [#muc_light_user{}]}).
-type muc_light_occupants() :: #muc_light_occupants{}.

-record(reactions, {msgid = <<>> :: binary()}).
-type reactions() :: #reactions{}.

-record(group_participants, {participant = [] :: [#group_participant{}]}).
-type group_participants() :: #group_participants{}.

-record(vcard_status, {vcard_status = <<>> :: binary()}).
-type vcard_status() :: #vcard_status{}.

-record(users, {user = [] :: [#buser{}]}).
-type users() :: #users{}.

-record(addresses, {list = [] :: [#address{}]}).
-type addresses() :: #addresses{}.

-record(starttls, {required = false :: boolean()}).
-type starttls() :: #starttls{}.

-record(last, {seconds :: 'undefined' | non_neg_integer(),
               status = <<>> :: binary()}).
-type last() :: #last{}.

-record('see-other-host', {host :: binary() | inet:ip_address() | {binary() | inet:ip_address(),inet:port_number()}}).
-type 'see-other-host'() :: #'see-other-host'{}.

-record(compress, {methods = [] :: [binary()]}).
-type compress() :: #compress{}.

-record(redirect, {uri = <<>> :: binary()}).
-type redirect() :: #redirect{}.

-record(sm_enabled, {id = <<>> :: binary(),
                     location = <<>> :: binary(),
                     max :: 'undefined' | non_neg_integer(),
                     resume = false :: boolean(),
                     xmlns = <<>> :: binary()}).
-type sm_enabled() :: #sm_enabled{}.

-record(upload_file_too_large, {'max-file-size' :: 'undefined' | integer(),
                                xmlns = <<>> :: binary()}).
-type upload_file_too_large() :: #upload_file_too_large{}.

-record(legacy_auth, {username :: 'undefined' | binary(),
                      password :: 'undefined' | binary(),
                      digest :: 'undefined' | binary(),
                      resource :: 'undefined' | binary()}).
-type legacy_auth() :: #legacy_auth{}.

-record(ps_subscribe, {node = <<>> :: binary(),
                       jid :: jid:jid()}).
-type ps_subscribe() :: #ps_subscribe{}.

-record(mix_presence, {xmlns = <<>> :: binary(),
                       jid :: undefined | jid:jid(),
                       nick = <<>> :: binary()}).
-type mix_presence() :: #mix_presence{}.

-record(idle, {since :: erlang:timestamp()}).
-type idle() :: #idle{}.

-record(muc_unique, {name = <<>> :: binary()}).
-type muc_unique() :: #muc_unique{}.

-record(broadcastname, {result_type = <<>> :: binary()}).
-type broadcastname() :: #broadcastname{}.

-record(broadcast, {name = <<>> :: binary(),
                    users = [] :: [#users{}],
                    status = <<>> :: binary(),
                    content = <<>> :: binary(),
                    team_id = <<>> :: binary(),
                    message_id = <<>> :: binary(),
                    message_type = <<>> :: binary(),
                    participants = [] :: [#participants{}],
                    broadcastname = [] :: [#broadcastname{}],
                    broadcastid = [] :: [#broadcastid{}]}).
-type broadcast() :: #broadcast{}.

-record(query, {type = <<>> :: binary(),
                broadcast = [] :: [#broadcast{}],
                result_type = <<>> :: binary(),
                status = <<>> :: binary(),
                sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type query() :: #query{}.

-record(markable, {}).
-type markable() :: #markable{}.

-record(sasl_response, {text = <<>> :: binary()}).
-type sasl_response() :: #sasl_response{}.

-record(x509_revoke, {cert :: binary(),
                      signature :: binary()}).
-type x509_revoke() :: #x509_revoke{}.

-record(sasl_auth, {mechanism = <<>> :: binary(),
                    text = <<>> :: binary()}).
-type sasl_auth() :: #sasl_auth{}.

-record(upload_retry, {stamp :: undefined | erlang:timestamp()}).
-type upload_retry() :: #upload_retry{}.

-record(feature_csi, {}).
-type feature_csi() :: #feature_csi{}.

-record(recall, {id = <<>> :: binary(),
                 time = <<>> :: binary()}).
-type recall() :: #recall{}.

-record(call, {socket_id = <<>> :: binary(),
               call_status = <<>> :: binary(),
               call_type = <<>> :: binary(),
               caller_device = <<>> :: binary(),
               call_attend_status = <<>> :: binary(),
               call_id = <<>> :: binary()}).
-type call() :: #call{}.

-record(report, {reason :: 'abuse' | 'spam' | 'undefined',
                 text = [] :: [#text{}]}).
-type report() :: #report{}.

-record(block_item, {jid :: jid:jid(),
                     spam_report :: 'undefined' | #report{}}).
-type block_item() :: #block_item{}.

-record(unblock, {items = [] :: [#block_item{}]}).
-type unblock() :: #unblock{}.

-record(block, {items = [] :: [#block_item{}]}).
-type block() :: #block{}.

-record(recentchat_item, {type = <<>> :: binary(),
                          value = <<>> :: binary()}).
-type recentchat_item() :: #recentchat_item{}.

-record(recentchat_item_list, {name = <<>> :: binary(),
                               items = [] :: [#recentchat_item{}]}).
-type recentchat_item_list() :: #recentchat_item_list{}.

-record(disco_item, {jid :: jid:jid(),
                     name = <<>> :: binary(),
                     node = <<>> :: binary()}).
-type disco_item() :: #disco_item{}.

-record(compression, {methods = [] :: [binary()]}).
-type compression() :: #compression{}.

-record(muc_subscription, {jid :: undefined | jid:jid(),
                           nick = <<>> :: binary(),
                           events = [] :: [binary()]}).
-type muc_subscription() :: #muc_subscription{}.

-record(muc_subscriptions, {list = [] :: [#muc_subscription{}]}).
-type muc_subscriptions() :: #muc_subscriptions{}.

-record(x509_cert_chain, {name = <<>> :: binary(),
                          certs = [] :: [binary()]}).
-type x509_cert_chain() :: #x509_cert_chain{}.

-record(ps_subscription, {xmlns = <<>> :: binary(),
                          jid :: jid:jid(),
                          type :: 'none' | 'pending' | 'subscribed' | 'unconfigured' | 'undefined',
                          node = <<>> :: binary(),
                          subid = <<>> :: binary(),
                          expiry :: undefined | erlang:timestamp()}).
-type ps_subscription() :: #ps_subscription{}.

-record(vcard_designation, {vcard_designation = <<>> :: binary()}).
-type vcard_designation() :: #vcard_designation{}.

-record(roster_designation, {roster_designation = <<>> :: binary()}).
-type roster_designation() :: #roster_designation{}.

-record(avatar_info, {bytes :: non_neg_integer(),
                      id = <<>> :: binary(),
                      type = <<>> :: binary(),
                      height :: 'undefined' | non_neg_integer(),
                      width :: 'undefined' | non_neg_integer(),
                      url = <<>> :: binary()}).
-type avatar_info() :: #avatar_info{}.

-record(avatar_meta, {info = [] :: [#avatar_info{}],
                      pointer :: 'undefined' | #avatar_pointer{}}).
-type avatar_meta() :: #avatar_meta{}.

-record(jidprep, {jid :: jid:jid()}).
-type jidprep() :: #jidprep{}.

-record(bob_data, {cid = <<>> :: binary(),
                   'max-age' :: 'undefined' | non_neg_integer(),
                   type = <<>> :: binary(),
                   data = <<>> :: binary()}).
-type bob_data() :: #bob_data{}.

-record(x509_register, {}).
-type x509_register() :: #x509_register{}.

-record(vcard_mobile_number, {vcard_mobile_number = <<>> :: binary()}).
-type vcard_mobile_number() :: #vcard_mobile_number{}.

-record(shim, {headers = [] :: [{binary(),binary()}]}).
-type shim() :: #shim{}.

-record(roster_mobilenumber, {roster_mobilenumber = <<>> :: binary()}).
-type roster_mobilenumber() :: #roster_mobilenumber{}.

-record(muc_item, {actor :: 'undefined' | #muc_actor{},
                   continue :: 'undefined' | binary(),
                   reason = <<>> :: binary(),
                   affiliation :: 'admin' | 'member' | 'none' | 'outcast' | 'owner' | 'undefined',
                   role :: 'moderator' | 'none' | 'participant' | 'undefined' | 'visitor',
                   jid :: undefined | jid:jid(),
                   nick = <<>> :: binary()}).
-type muc_item() :: #muc_item{}.

-record(muc_admin, {items = [] :: [#muc_item{}]}).
-type muc_admin() :: #muc_admin{}.

-record(caps, {node = <<>> :: binary(),
               version = <<>> :: binary(),
               hash = <<>> :: binary(),
               exts = [] :: [binary()]}).
-type caps() :: #caps{}.

-record(muc, {history :: 'undefined' | #muc_history{},
              password :: 'undefined' | binary()}).
-type muc() :: #muc{}.

-record(stats, {list = [] :: [#stat{}],
                node = <<>> :: binary()}).
-type stats() :: #stats{}.

-record(ps_items, {xmlns = <<>> :: binary(),
                   node = <<>> :: binary(),
                   items = [] :: [#ps_item{}],
                   max_items :: 'undefined' | non_neg_integer(),
                   subid = <<>> :: binary(),
                   retract :: 'undefined' | binary()}).
-type ps_items() :: #ps_items{}.

-record(mam_prefs, {xmlns = <<>> :: binary(),
                    default :: 'always' | 'never' | 'roster' | 'undefined',
                    always :: undefined | [jid:jid()],
                    never :: undefined | [jid:jid()]}).
-type mam_prefs() :: #mam_prefs{}.

-record(delete_messages, {delete_message = [] :: [#user_activities{}]}).
-type delete_messages() :: #delete_messages{}.

-record(del_message_activities, {type = <<>> :: binary(),
                                 status = <<>> :: binary(),
                                 to_user = <<>> :: binary(),
                                 file_tokens = <<>> :: binary(),
                                 delete_type = <<>> :: binary(),
                                 delete_messages = [] :: [#delete_messages{}],
                                 result_type = <<>> :: binary(),
                                 sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type del_message_activities() :: #del_message_activities{}.

-record(stream_features, {sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type stream_features() :: #stream_features{}.

-record(sic, {ip :: undefined | inet:ip_address(),
              port :: 'undefined' | non_neg_integer(),
              xmlns = <<>> :: binary()}).
-type sic() :: #sic{}.

-record(receipt_request, {}).
-type receipt_request() :: #receipt_request{}.

-record(vcard_email, {home = false :: boolean(),
                      work = false :: boolean(),
                      internet = false :: boolean(),
                      pref = false :: boolean(),
                      x400 = false :: boolean(),
                      userid :: 'undefined' | binary()}).
-type vcard_email() :: #vcard_email{}.

-record(delivered, {id = <<>> :: binary(),
                    time = <<>> :: binary()}).
-type delivered() :: #delivered{}.

-record(db_result, {from = <<>> :: binary(),
                    to = <<>> :: binary(),
                    type :: 'error' | 'invalid' | 'undefined' | 'valid',
                    key = <<>> :: binary(),
                    sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type db_result() :: #db_result{}.

-record(carbons_received, {forwarded :: #forwarded{}}).
-type carbons_received() :: #carbons_received{}.

-record(ps_retract, {node = <<>> :: binary(),
                     notify = false :: boolean(),
                     items = [] :: [#ps_item{}]}).
-type ps_retract() :: #ps_retract{}.

-record(muc_hat, {title = <<>> :: binary(),
                  uri = <<>> :: binary()}).
-type muc_hat() :: #muc_hat{}.

-record(muc_hats, {hats = [] :: [#muc_hat{}]}).
-type muc_hats() :: #muc_hats{}.

-record(vcard_geo, {lat :: 'undefined' | binary(),
                    lon :: 'undefined' | binary()}).
-type vcard_geo() :: #vcard_geo{}.

-record(sasl_failure, {reason :: 'aborted' | 'account-disabled' | 'bad-protocol' | 'credentials-expired' | 'encryption-required' | 'incorrect-encoding' | 'invalid-authzid' | 'invalid-mechanism' | 'malformed-request' | 'mechanism-too-weak' | 'not-authorized' | 'temporary-auth-failure' | 'undefined',
                       text = [] :: [#text{}]}).
-type sasl_failure() :: #sasl_failure{}.

-record(chatcontent, {block_user = <<48>> :: binary(),
                      broadcast_id = <<>> :: binary(),
                      broadcast_msgid = <<>> :: binary(),
                      message_type = <<>> :: binary()}).
-type chatcontent() :: #chatcontent{}.

-record(hash_used, {algo = <<>> :: binary()}).
-type hash_used() :: #hash_used{}.

-record(mix, {submission_id = <<>> :: binary(),
              jid :: undefined | jid:jid(),
              nick = <<>> :: binary(),
              xmlns = <<>> :: binary()}).
-type mix() :: #mix{}.

-record(carbons_sent, {forwarded :: #forwarded{}}).
-type carbons_sent() :: #carbons_sent{}.

-record(mam_archived, {by :: jid:jid(),
                       id = <<>> :: binary()}).
-type mam_archived() :: #mam_archived{}.

-record(compress_failure, {reason :: 'processing-failed' | 'setup-failed' | 'undefined' | 'unsupported-method'}).
-type compress_failure() :: #compress_failure{}.

-record(origin_id, {id = <<>> :: binary()}).
-type origin_id() :: #origin_id{}.

-record(x509_ca_list, {certs = [] :: [binary()]}).
-type x509_ca_list() :: #x509_ca_list{}.

-record(mix_participant, {jid :: jid:jid(),
                          nick = <<>> :: binary(),
                          xmlns = <<>> :: binary(),
                          usernick = <<>> :: binary(),
                          sendernick = <<>> :: binary(),
                          request_type = <<>> :: binary()}).
-type mix_participant() :: #mix_participant{}.

-record(compressed, {}).
-type compressed() :: #compressed{}.

-record(block_list, {items = [] :: [#block_item{}]}).
-type block_list() :: #block_list{}.

-record(upload_slot, {get :: 'undefined' | binary(),
                      put :: 'undefined' | binary(),
                      xmlns = <<>> :: binary()}).
-type upload_slot() :: #upload_slot{}.

-record(xevent, {offline = false :: boolean(),
                 delivered = false :: boolean(),
                 displayed = false :: boolean(),
                 composing = false :: boolean(),
                 id :: 'undefined' | binary()}).
-type xevent() :: #xevent{}.

-record(sasl_abort, {}).
-type sasl_abort() :: #sasl_abort{}.

-record(jingle_ft_file, {date :: undefined | erlang:timestamp(),
                         desc = [] :: [#text{}],
                         hash = [] :: [#hash{}],
                         'hash-used' :: 'undefined' | #hash_used{},
                         'media-type' :: 'undefined' | binary(),
                         name :: 'undefined' | binary(),
                         size :: 'undefined' | non_neg_integer(),
                         range :: 'undefined' | #jingle_ft_range{}}).
-type jingle_ft_file() :: #jingle_ft_file{}.

-record(jingle_ft_checksum, {creator :: 'initiator' | 'responder' | 'undefined',
                             name = <<>> :: binary(),
                             file :: #jingle_ft_file{}}).
-type jingle_ft_checksum() :: #jingle_ft_checksum{}.

-record(jingle_ft_description, {file :: 'undefined' | #jingle_ft_file{}}).
-type jingle_ft_description() :: #jingle_ft_description{}.

-record(mix_client_leave, {channel :: undefined | jid:jid(),
                           leave :: #mix_leave{},
                           xmlns = <<>> :: binary()}).
-type mix_client_leave() :: #mix_client_leave{}.

-record(legacy_auth_feature, {}).
-type legacy_auth_feature() :: #legacy_auth_feature{}.

-record(bind, {jid :: undefined | jid:jid(),
               resource = <<>> :: binary()}).
-type bind() :: #bind{}.

-record(rosterver_feature, {}).
-type rosterver_feature() :: #rosterver_feature{}.

-record(x509_challenge, {transaction = <<>> :: binary(),
                         uri = <<>> :: binary(),
                         signature :: binary()}).
-type x509_challenge() :: #x509_challenge{}.

-record(muc_invite, {reason = <<>> :: binary(),
                     from :: undefined | jid:jid(),
                     to :: undefined | jid:jid(),
                     continue :: 'undefined' | binary()}).
-type muc_invite() :: #muc_invite{}.

-record(vcard_xupdate, {hash :: 'undefined' | binary()}).
-type vcard_xupdate() :: #vcard_xupdate{}.

-record(muc_light_create, {configuration = [] :: [#muc_light_configuration{}],
                           occupants = [] :: [#muc_light_occupants{}]}).
-type muc_light_create() :: #muc_light_create{}.

-record(bytestreams, {hosts = [] :: [#streamhost{}],
                      used :: undefined | jid:jid(),
                      activate :: undefined | jid:jid(),
                      dstaddr = <<>> :: binary(),
                      mode = tcp :: 'tcp' | 'udp',
                      sid = <<>> :: binary()}).
-type bytestreams() :: #bytestreams{}.

-record(upload_request, {filename :: binary(),
                         size :: non_neg_integer(),
                         'content-type' = <<>> :: binary(),
                         xmlns = <<>> :: binary()}).
-type upload_request() :: #upload_request{}.

-record(mix_update_subscription, {xmlns = <<>> :: binary(),
                                  jid :: undefined | jid:jid(),
                                  subscribe = [] :: [binary()],
                                  unsubscribe = [] :: [binary()]}).
-type mix_update_subscription() :: #mix_update_subscription{}.

-record(xdata_option, {label = <<>> :: binary(),
                       value :: binary()}).
-type xdata_option() :: #xdata_option{}.

-record(xdata_field, {label = <<>> :: binary(),
                      type :: 'boolean' | 'fixed' | 'hidden' | 'jid-multi' | 'jid-single' | 'list-multi' | 'list-single' | 'text-multi' | 'text-private' | 'text-single' | 'undefined',
                      var = <<>> :: binary(),
                      required = false :: boolean(),
                      desc = <<>> :: binary(),
                      values = [] :: [binary()],
                      options = [] :: [#xdata_option{}],
                      sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type xdata_field() :: #xdata_field{}.

-record(push_disable, {jid :: jid:jid(),
                       node = <<>> :: binary()}).
-type push_disable() :: #push_disable{}.

-record(jingle_s5b_candidate, {cid = <<>> :: binary(),
                               host :: inet:ip_address(),
                               port :: 'undefined' | non_neg_integer(),
                               jid :: jid:jid(),
                               type = direct :: 'assisted' | 'direct' | 'proxy' | 'tunnel',
                               priority :: non_neg_integer()}).
-type jingle_s5b_candidate() :: #jingle_s5b_candidate{}.

-record(jingle_s5b_transport, {sid = <<>> :: binary(),
                               dstaddr = <<>> :: binary(),
                               mode = tcp :: 'tcp' | 'udp',
                               candidates = [] :: [#jingle_s5b_candidate{}],
                               'candidate-used' :: 'undefined' | binary(),
                               activated :: 'undefined' | binary(),
                               error :: 'candidate-error' | 'proxy-error' | 'undefined'}).
-type jingle_s5b_transport() :: #jingle_s5b_transport{}.

-record(vcard_nickName, {vcard_nickName = <<>> :: binary()}).
-type vcard_nickName() :: #vcard_nickName{}.

-record(delegated, {ns = <<>> :: binary(),
                    attrs = [] :: [binary()]}).
-type delegated() :: #delegated{}.

-record(carbons_disable, {}).
-type carbons_disable() :: #carbons_disable{}.

-record(version, {name :: 'undefined' | binary(),
                  ver :: 'undefined' | binary(),
                  os :: 'undefined' | binary()}).
-type version() :: #version{}.

-record(adhoc_actions, {execute :: 'complete' | 'next' | 'prev' | 'undefined',
                        prev = false :: boolean(),
                        next = false :: boolean(),
                        complete = false :: boolean()}).
-type adhoc_actions() :: #adhoc_actions{}.

-record(vcard_org, {name :: 'undefined' | binary(),
                    units = [] :: [binary()]}).
-type vcard_org() :: #vcard_org{}.

-record(roster_coverimg, {roster_coverimg = <<>> :: binary()}).
-type roster_coverimg() :: #roster_coverimg{}.

-record(vcard_tel, {home = false :: boolean(),
                    work = false :: boolean(),
                    voice = false :: boolean(),
                    fax = false :: boolean(),
                    pager = false :: boolean(),
                    msg = false :: boolean(),
                    cell = false :: boolean(),
                    video = false :: boolean(),
                    bbs = false :: boolean(),
                    modem = false :: boolean(),
                    isdn = false :: boolean(),
                    pcs = false :: boolean(),
                    pref = false :: boolean(),
                    number :: 'undefined' | binary()}).
-type vcard_tel() :: #vcard_tel{}.

-record(rsm_set, {'after' :: 'undefined' | binary(),
                  before :: 'undefined' | binary(),
                  count :: 'undefined' | non_neg_integer(),
                  first :: 'undefined' | #rsm_first{},
                  index :: 'undefined' | non_neg_integer(),
                  last :: 'undefined' | binary(),
                  max :: 'undefined' | non_neg_integer()}).
-type rsm_set() :: #rsm_set{}.

-record(mam_fin, {xmlns = <<>> :: binary(),
                  id = <<>> :: binary(),
                  rsm :: 'undefined' | #rsm_set{},
                  stable :: 'false' | 'true' | 'undefined',
                  complete :: 'false' | 'true' | 'undefined'}).
-type mam_fin() :: #mam_fin{}.

-record(disco_items, {node = <<>> :: binary(),
                      items = [] :: [#disco_item{}],
                      rsm :: 'undefined' | #rsm_set{}}).
-type disco_items() :: #disco_items{}.

-record(vcard_name, {family :: 'undefined' | binary(),
                     given :: 'undefined' | binary(),
                     middle :: 'undefined' | binary(),
                     prefix :: 'undefined' | binary(),
                     suffix :: 'undefined' | binary()}).
-type vcard_name() :: #vcard_name{}.

-record(inbox_entry, {unread :: 'undefined' | non_neg_integer(),
                      jid :: undefined | jid:jid(),
                      id = <<>> :: binary()}).
-type inbox_entry() :: #inbox_entry{}.

-record(media_uri, {type = <<>> :: binary(),
                    uri = <<>> :: binary()}).
-type media_uri() :: #media_uri{}.

-record(media, {height :: 'undefined' | non_neg_integer(),
                width :: 'undefined' | non_neg_integer(),
                uri = [] :: [#media_uri{}]}).
-type media() :: #media{}.

-record(mix_destroy, {channel :: any(),
                      xmlns = <<>> :: binary()}).
-type mix_destroy() :: #mix_destroy{}.

-record(vcard_key, {type :: 'undefined' | binary(),
                    cred :: 'undefined' | binary()}).
-type vcard_key() :: #vcard_key{}.

-record(group_query, {status = <<>> :: binary(),
                      type = <<>> :: binary(),
                      chat_type = <<>> :: binary(),
                      msgid = <<>> :: binary(),
                      group_id = <<>> :: binary(),
                      pin_status = <<>> :: binary(),
                      ptt_status = <<>> :: binary(),
                      subscriptions = [] :: [#group_subscriptions{}],
                      participants = [] :: [#group_participants{}],
                      result_type = <<>> :: binary(),
                      sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type group_query() :: #group_query{}.

-record(inbox_query, {rsm :: 'undefined' | #rsm_set{}}).
-type inbox_query() :: #inbox_query{}.

-record(identity, {category = <<>> :: binary(),
                   type = <<>> :: binary(),
                   lang = <<>> :: binary(),
                   name = <<>> :: binary()}).
-type identity() :: #identity{}.

-record(muc_destroy, {xmlns = <<>> :: binary(),
                      jid :: undefined | jid:jid(),
                      reason = <<>> :: binary(),
                      password :: 'undefined' | binary()}).
-type muc_destroy() :: #muc_destroy{}.

-record(muc_user, {decline :: 'undefined' | #muc_decline{},
                   destroy :: 'undefined' | #muc_destroy{},
                   invites = [] :: [#muc_invite{}],
                   items = [] :: [#muc_item{}],
                   status_codes = [] :: [pos_integer()],
                   password :: 'undefined' | binary()}).
-type muc_user() :: #muc_user{}.

-record(bookmark_conference, {name = <<>> :: binary(),
                              jid :: jid:jid(),
                              autojoin = false :: boolean(),
                              nick :: 'undefined' | binary(),
                              password :: 'undefined' | binary()}).
-type bookmark_conference() :: #bookmark_conference{}.

-record(mix_setnick, {nick :: binary(),
                      xmlns = <<>> :: binary()}).
-type mix_setnick() :: #mix_setnick{}.

-record(mix_roster_channel, {participant_id = <<>> :: binary()}).
-type mix_roster_channel() :: #mix_roster_channel{}.

-record(xmpp_session, {optional = false :: boolean()}).
-type xmpp_session() :: #xmpp_session{}.

-record(bookmark_url, {name = <<>> :: binary(),
                       url = <<>> :: binary()}).
-type bookmark_url() :: #bookmark_url{}.

-record(bookmark_storage, {conference = [] :: [#bookmark_conference{}],
                           url = [] :: [#bookmark_url{}]}).
-type bookmark_storage() :: #bookmark_storage{}.

-record(oob_x, {url :: binary(),
                desc = <<>> :: binary(),
                sid = <<>> :: binary()}).
-type oob_x() :: #oob_x{}.

-record(vcard_sound, {phonetic :: 'undefined' | binary(),
                      binval :: 'undefined' | binary(),
                      extval :: 'undefined' | binary()}).
-type vcard_sound() :: #vcard_sound{}.

-record(vcard_photo, {type :: 'undefined' | binary(),
                      binval :: 'undefined' | binary(),
                      extval :: 'undefined' | binary()}).
-type vcard_photo() :: #vcard_photo{}.

-record(vcard_label, {home = false :: boolean(),
                      work = false :: boolean(),
                      postal = false :: boolean(),
                      parcel = false :: boolean(),
                      dom = false :: boolean(),
                      intl = false :: boolean(),
                      pref = false :: boolean(),
                      line = [] :: [binary()]}).
-type vcard_label() :: #vcard_label{}.

-record(vcard_adr, {home = false :: boolean(),
                    work = false :: boolean(),
                    postal = false :: boolean(),
                    parcel = false :: boolean(),
                    dom = false :: boolean(),
                    intl = false :: boolean(),
                    pref = false :: boolean(),
                    pobox :: 'undefined' | binary(),
                    extadd :: 'undefined' | binary(),
                    street :: 'undefined' | binary(),
                    locality :: 'undefined' | binary(),
                    region :: 'undefined' | binary(),
                    pcode :: 'undefined' | binary(),
                    ctry :: 'undefined' | binary()}).
-type vcard_adr() :: #vcard_adr{}.

-record(roster_email, {roster_email = <<>> :: binary()}).
-type roster_email() :: #roster_email{}.

-record(roster_vcard, {roster_vcard = <<>> :: binary(),
                       roster_nickname = [] :: [#roster_nickname{}],
                       roster_status = [] :: [#roster_status{}],
                       roster_mobilenumber = [] :: [#roster_mobilenumber{}],
                       roster_coverimg = [] :: [#roster_coverimg{}],
                       roster_designation = [] :: [#roster_designation{}],
                       roster_name = [] :: [#roster_name{}],
                       roster_image = [] :: [#roster_image{}],
                       roster_email = [] :: [#roster_email{}],
                       roster_notification = [] :: [#roster_notification{}]}).
-type roster_vcard() :: #roster_vcard{}.

-record(roster_profile, {vCard = [] :: [#roster_vcard{}]}).
-type roster_profile() :: #roster_profile{}.

-record(roster_item, {jid :: jid:jid(),
                      name = <<>> :: binary(),
                      groups = [] :: [binary()],
                      subscription = none :: 'both' | 'from' | 'none' | 'remove' | 'to',
                      ask :: 'subscribe' | 'undefined',
                      profiles = [] :: [#roster_profile{}],
                      mix_channel :: 'undefined' | #mix_roster_channel{}}).
-type roster_item() :: #roster_item{}.

-record(roster_query, {items = [] :: [#roster_item{}],
                       ver :: 'undefined' | binary(),
                       mix_annotate = false :: boolean()}).
-type roster_query() :: #roster_query{}.

-record(xdata, {type :: 'cancel' | 'form' | 'result' | 'submit',
                instructions = [] :: [binary()],
                title :: 'undefined' | binary(),
                reported :: 'undefined' | [#xdata_field{}],
                items = [] :: [[#xdata_field{}]],
                fields = [] :: [#xdata_field{}]}).
-type xdata() :: #xdata{}.

-record(service, {action :: 'add' | 'modify' | 'remove' | 'undefined',
                  expires :: undefined | erlang:timestamp(),
                  host :: binary() | inet:ip_address(),
                  name = <<>> :: binary(),
                  password = <<>> :: binary(),
                  port :: 'undefined' | non_neg_integer(),
                  restricted :: 'false' | 'true' | 'undefined',
                  transport :: 'tcp' | 'udp' | 'undefined',
                  type :: 'stun' | 'stuns' | 'turn' | 'turns',
                  username = <<>> :: binary(),
                  xdata :: 'undefined' | #xdata{}}).
-type service() :: #service{}.

-record(credentials, {services = [] :: [#service{}]}).
-type credentials() :: #credentials{}.

-record(services, {type :: 'stun' | 'stuns' | 'turn' | 'turns' | 'undefined',
                   list = [] :: [#service{}]}).
-type services() :: #services{}.

-record(push_enable, {jid :: jid:jid(),
                      node = <<>> :: binary(),
                      xdata :: 'undefined' | #xdata{}}).
-type push_enable() :: #push_enable{}.

-record(xcaptcha, {xdata :: #xdata{}}).
-type xcaptcha() :: #xcaptcha{}.

-record(adhoc_command, {node = <<>> :: binary(),
                        action = execute :: 'cancel' | 'complete' | 'execute' | 'next' | 'prev',
                        sid = <<>> :: binary(),
                        status :: 'canceled' | 'completed' | 'executing' | 'undefined',
                        lang = <<>> :: binary(),
                        actions :: 'undefined' | #adhoc_actions{},
                        notes = [] :: [#adhoc_note{}],
                        xdata :: 'undefined' | #xdata{}}).
-type adhoc_command() :: #adhoc_command{}.

-record(mam_query, {xmlns = <<>> :: binary(),
                    id = <<>> :: binary(),
                    start :: undefined | erlang:timestamp(),
                    'end' :: undefined | erlang:timestamp(),
                    with :: undefined | jid:jid(),
                    withtext :: 'undefined' | binary(),
                    rsm :: 'undefined' | #rsm_set{},
                    flippage = false :: boolean(),
                    xdata :: 'undefined' | #xdata{}}).
-type mam_query() :: #mam_query{}.

-record(pubsub_owner, {affiliations :: 'undefined' | {binary(),[#ps_affiliation{}]},
                       configure :: 'undefined' | {binary(),'undefined' | #xdata{}},
                       default :: 'undefined' | {binary(),'undefined' | #xdata{}},
                       delete :: 'undefined' | {binary(),binary()},
                       purge :: 'undefined' | binary(),
                       subscriptions :: 'undefined' | {binary(),[#ps_subscription{}]}}).
-type pubsub_owner() :: #pubsub_owner{}.

-record(ps_options, {node = <<>> :: binary(),
                     jid :: undefined | jid:jid(),
                     subid = <<>> :: binary(),
                     xdata :: 'undefined' | #xdata{}}).
-type ps_options() :: #ps_options{}.

-record(pubsub, {subscriptions :: 'undefined' | {binary(),[#ps_subscription{}]},
                 subscription :: 'undefined' | #ps_subscription{},
                 affiliations :: 'undefined' | {binary(),[#ps_affiliation{}]},
                 publish :: 'undefined' | #ps_publish{},
                 publish_options :: 'undefined' | #xdata{},
                 subscribe :: 'undefined' | #ps_subscribe{},
                 unsubscribe :: 'undefined' | #ps_unsubscribe{},
                 options :: 'undefined' | #ps_options{},
                 items :: 'undefined' | #ps_items{},
                 retract :: 'undefined' | #ps_retract{},
                 create :: 'undefined' | binary(),
                 configure :: 'undefined' | {binary(),'undefined' | #xdata{}},
                 default :: 'undefined' | {binary(),'undefined' | #xdata{}},
                 delete :: 'undefined' | {binary(),binary()},
                 purge :: 'undefined' | binary(),
                 rsm :: 'undefined' | #rsm_set{}}).
-type pubsub() :: #pubsub{}.

-record(ps_event, {items :: 'undefined' | #ps_items{},
                   purge :: 'undefined' | binary(),
                   subscription :: 'undefined' | #ps_subscription{},
                   delete :: 'undefined' | {binary(),binary()},
                   create :: 'undefined' | binary(),
                   configuration :: 'undefined' | {binary(),'undefined' | #xdata{}}}).
-type ps_event() :: #ps_event{}.

-record(register, {registered = false :: boolean(),
                   remove = false :: boolean(),
                   instructions :: 'undefined' | binary(),
                   username :: 'undefined' | binary(),
                   nick :: 'undefined' | binary(),
                   password :: 'undefined' | binary(),
                   name :: 'undefined' | binary(),
                   first :: 'undefined' | binary(),
                   last :: 'undefined' | binary(),
                   email :: 'undefined' | binary(),
                   address :: 'undefined' | binary(),
                   city :: 'undefined' | binary(),
                   state :: 'undefined' | binary(),
                   zip :: 'undefined' | binary(),
                   phone :: 'undefined' | binary(),
                   url :: 'undefined' | binary(),
                   date :: 'undefined' | binary(),
                   misc :: 'undefined' | binary(),
                   text :: 'undefined' | binary(),
                   key :: 'undefined' | binary(),
                   xdata :: 'undefined' | #xdata{},
                   sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type register() :: #register{}.

-record(disco_info, {node = <<>> :: binary(),
                     identities = [] :: [#identity{}],
                     features = [] :: [binary()],
                     xdata = [] :: [#xdata{}]}).
-type disco_info() :: #disco_info{}.

-record(sasl_mechanisms, {list = [] :: [binary()]}).
-type sasl_mechanisms() :: #sasl_mechanisms{}.

-record(offline_item, {node = <<>> :: binary(),
                       action :: 'remove' | 'undefined' | 'view'}).
-type offline_item() :: #offline_item{}.

-record(offline, {items = [] :: [#offline_item{}],
                  purge = false :: boolean(),
                  fetch = false :: boolean()}).
-type offline() :: #offline{}.

-record(muc_owner, {destroy :: 'undefined' | #muc_destroy{},
                    config :: 'undefined' | #xdata{},
                    items = [] :: [#muc_item{}]}).
-type muc_owner() :: #muc_owner{}.

-record(search_item, {jid :: jid:jid(),
                      first :: 'undefined' | binary(),
                      last :: 'undefined' | binary(),
                      nick :: 'undefined' | binary(),
                      email :: 'undefined' | binary()}).
-type search_item() :: #search_item{}.

-record(search, {instructions :: 'undefined' | binary(),
                 first :: 'undefined' | binary(),
                 last :: 'undefined' | binary(),
                 nick :: 'undefined' | binary(),
                 email :: 'undefined' | binary(),
                 items = [] :: [#search_item{}],
                 xdata :: 'undefined' | #xdata{}}).
-type search() :: #search{}.

-record(delegation, {delegated = [] :: [#delegated{}],
                     forwarded :: 'undefined' | #forwarded{}}).
-type delegation() :: #delegation{}.

-record(push_notification, {xdata :: 'undefined' | #xdata{}}).
-type push_notification() :: #push_notification{}.

-record(jingle_reason, {reason :: atom(),
                        text = [] :: [#text{}],
                        sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type jingle_reason() :: #jingle_reason{}.

-record(jingle, {action :: 'content-accept' | 'content-add' | 'content-modify' | 'content-reject' | 'content-remove' | 'description-info' | 'security-info' | 'session-accept' | 'session-info' | 'session-initiate' | 'session-terminate' | 'transport-accept' | 'transport-info' | 'transport-reject' | 'transport-replace',
                 sid = <<>> :: binary(),
                 initiator :: undefined | jid:jid(),
                 responder :: undefined | jid:jid(),
                 content = [] :: [#jingle_content{}],
                 reason :: 'undefined' | #jingle_reason{},
                 sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type jingle() :: #jingle{}.

-record(mix_join, {id = <<>> :: binary(),
                   jid :: undefined | jid:jid(),
                   nick = <<>> :: binary(),
                   subscribe = [] :: [binary()],
                   xmlns = <<117,114,110,58,120,109,112,112,58,109,105,120,58,99,111,114,101,58,48>> :: binary(),
                   owner = <<>> :: binary(),
                   usernick = <<>> :: binary(),
                   sendernick = <<>> :: binary(),
                   request_type = <<>> :: binary()}).
-type mix_join() :: #mix_join{}.

-record(inbox_fin, {total :: 'undefined' | non_neg_integer(),
                    unread :: 'undefined' | non_neg_integer(),
                    all_unread :: 'undefined' | non_neg_integer(),
                    rsm :: 'undefined' | #rsm_set{}}).
-type inbox_fin() :: #inbox_fin{}.

-record(privacy_item, {order :: non_neg_integer(),
                       action :: 'allow' | 'deny',
                       type :: 'group' | 'jid' | 'subscription' | 'undefined',
                       value = <<>> :: binary(),
                       message = false :: boolean(),
                       iq = false :: boolean(),
                       presence_in = false :: boolean(),
                       presence_out = false :: boolean()}).
-type privacy_item() :: #privacy_item{}.

-record(privacy_list, {name = <<>> :: binary(),
                       items = [] :: [#privacy_item{}]}).
-type privacy_list() :: #privacy_list{}.

-record(privacy_query, {lists = [] :: [#privacy_list{}],
                        default :: 'none' | 'undefined' | binary(),
                        active :: 'none' | 'undefined' | binary()}).
-type privacy_query() :: #privacy_query{}.

-record(sm_failed, {reason :: atom() | #gone{} | #redirect{},
                    text = [] :: [#text{}],
                    h :: 'undefined' | non_neg_integer(),
                    xmlns = <<>> :: binary()}).
-type sm_failed() :: #sm_failed{}.

-record(stanza_error, {type :: 'auth' | 'cancel' | 'continue' | 'modify' | 'wait',
                       code :: 'undefined' | non_neg_integer(),
                       by :: undefined | jid:jid(),
                       reason :: atom() | #gone{} | #redirect{},
                       text = [] :: [#text{}],
                       sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type stanza_error() :: #stanza_error{}.

-record(seen, {id = <<>> :: binary(),
               time = <<>> :: binary(),
               chat_type = <<>> :: binary(),
               conversation_jid = <<>> :: binary()}).
-type seen() :: #seen{}.

-record(stream_error, {reason :: atom() | #'see-other-host'{},
                       text = [] :: [#text{}]}).
-type stream_error() :: #stream_error{}.

-record(mix_client_join, {channel :: undefined | jid:jid(),
                          join :: #mix_join{},
                          xmlns = <<>> :: binary(),
                          affiliation = <<>> :: binary()}).
-type mix_client_join() :: #mix_client_join{}.

-record(time, {tzo :: 'undefined' | {integer(),integer()},
               utc :: undefined | erlang:timestamp()}).
-type time() :: #time{}.

-record(vcard_logo, {type :: 'undefined' | binary(),
                     binval :: 'undefined' | binary(),
                     extval :: 'undefined' | binary()}).
-type vcard_logo() :: #vcard_logo{}.

-record(vcard_temp, {version :: 'undefined' | binary(),
                     fn :: 'undefined' | binary(),
                     n :: 'undefined' | #vcard_name{},
                     nickname :: 'undefined' | binary(),
                     photo :: 'undefined' | #vcard_photo{},
                     bday :: 'undefined' | binary(),
                     adr = [] :: [#vcard_adr{}],
                     label = [] :: [#vcard_label{}],
                     tel = [] :: [#vcard_tel{}],
                     email = [] :: [#vcard_email{}],
                     jabberid :: 'undefined' | binary(),
                     mailer :: 'undefined' | binary(),
                     tz :: 'undefined' | binary(),
                     geo :: 'undefined' | #vcard_geo{},
                     title :: 'undefined' | binary(),
                     role :: 'undefined' | binary(),
                     logo :: 'undefined' | #vcard_logo{},
                     org :: 'undefined' | #vcard_org{},
                     vcard_status :: 'undefined' | #vcard_status{},
                     vcard_mobile_number :: 'undefined' | #vcard_mobile_number{},
                     vcard_designation :: 'undefined' | #vcard_designation{},
                     vcard_coverimg :: 'undefined' | #vcard_coverimg{},
                     vcard_image :: 'undefined' | #vcard_image{},
                     vcard_emailid :: 'undefined' | #vcard_emailid{},
                     vcard_nickName :: 'undefined' | #vcard_nickName{},
                     categories = [] :: [binary()],
                     note :: 'undefined' | binary(),
                     prodid :: 'undefined' | binary(),
                     rev :: 'undefined' | binary(),
                     sort_string :: 'undefined' | binary(),
                     sound :: 'undefined' | #vcard_sound{},
                     uid :: 'undefined' | binary(),
                     url :: 'undefined' | binary(),
                     class :: 'confidential' | 'private' | 'public' | 'undefined',
                     key :: 'undefined' | #vcard_key{},
                     desc :: 'undefined' | binary(),
                     sub_els = [] :: [xmpp_element() | fxml:xmlel()]}).
-type vcard_temp() :: #vcard_temp{}.

-type xmpp_element() :: acknowledge() |
                        address() |
                        addresses() |
                        adhoc_actions() |
                        adhoc_command() |
                        adhoc_note() |
                        avatar_data() |
                        avatar_info() |
                        avatar_meta() |
                        avatar_pointer() |
                        bind() |
                        block() |
                        block_item() |
                        block_list() |
                        bob_data() |
                        bookmark_conference() |
                        bookmark_storage() |
                        bookmark_url() |
                        broadcast() |
                        broadcastid() |
                        broadcastname() |
                        buser() |
                        bytestreams() |
                        call() |
                        caps() |
                        carbons_disable() |
                        carbons_enable() |
                        carbons_private() |
                        carbons_received() |
                        carbons_sent() |
                        chatcontent() |
                        chatstate() |
                        compress() |
                        compress_failure() |
                        compressed() |
                        compression() |
                        credentials() |
                        csi() |
                        db_feature() |
                        db_result() |
                        db_verify() |
                        del_message_activities() |
                        delay() |
                        delegated() |
                        delegation() |
                        delegation_query() |
                        delete_messages() |
                        delivered() |
                        disco_info() |
                        disco_item() |
                        disco_items() |
                        expire() |
                        feature_csi() |
                        feature_register() |
                        feature_sm() |
                        forwarded() |
                        gone() |
                        group_participant() |
                        group_participants() |
                        group_query() |
                        group_subscription() |
                        group_subscriptions() |
                        handshake() |
                        hash() |
                        hash_used() |
                        hint() |
                        ibb_close() |
                        ibb_data() |
                        ibb_open() |
                        identity() |
                        idle() |
                        inbox_entry() |
                        inbox_fin() |
                        inbox_query() |
                        iq() |
                        jidprep() |
                        jingle() |
                        jingle_content() |
                        jingle_error() |
                        jingle_ft_checksum() |
                        jingle_ft_description() |
                        jingle_ft_error() |
                        jingle_ft_file() |
                        jingle_ft_range() |
                        jingle_ft_received() |
                        jingle_ibb_transport() |
                        jingle_reason() |
                        jingle_s5b_candidate() |
                        jingle_s5b_transport() |
                        last() |
                        legacy_auth() |
                        legacy_auth_feature() |
                        logout() |
                        mam_archived() |
                        mam_fin() |
                        mam_prefs() |
                        mam_query() |
                        mam_result() |
                        mark_acknowledged() |
                        mark_displayed() |
                        mark_received() |
                        markable() |
                        media() |
                        media_call_activities() |
                        media_uri() |
                        mediacall() |
                        message() |
                        message_thread() |
                        mix() |
                        mix_client_join() |
                        mix_client_leave() |
                        mix_create() |
                        mix_destroy() |
                        mix_join() |
                        mix_leave() |
                        mix_participant() |
                        mix_presence() |
                        mix_roster_channel() |
                        mix_setnick() |
                        mix_update_subscription() |
                        muc() |
                        muc_actor() |
                        muc_admin() |
                        muc_decline() |
                        muc_destroy() |
                        muc_hat() |
                        muc_hats() |
                        muc_history() |
                        muc_invite() |
                        muc_item() |
                        muc_light_aff() |
                        muc_light_configuration() |
                        muc_light_create() |
                        muc_light_destroy() |
                        muc_light_occupants() |
                        muc_light_user() |
                        muc_light_x() |
                        muc_owner() |
                        muc_subscribe() |
                        muc_subscription() |
                        muc_subscriptions() |
                        muc_unique() |
                        muc_unsubscribe() |
                        muc_user() |
                        nick() |
                        offline() |
                        offline_item() |
                        oob_x() |
                        origin_id() |
                        participant() |
                        participants() |
                        ping() |
                        presence() |
                        privacy_item() |
                        privacy_list() |
                        privacy_query() |
                        private() |
                        privilege() |
                        privilege_perm() |
                        profile_update() |
                        ps_affiliation() |
                        ps_error() |
                        ps_event() |
                        ps_item() |
                        ps_items() |
                        ps_options() |
                        ps_publish() |
                        ps_retract() |
                        ps_subscribe() |
                        ps_subscription() |
                        ps_unsubscribe() |
                        pubsub() |
                        pubsub_owner() |
                        push_disable() |
                        push_enable() |
                        push_notification() |
                        query() |
                        reaction() |
                        reactions() |
                        recall() |
                        receipt_request() |
                        receipt_response() |
                        recentchat_item() |
                        recentchat_item_list() |
                        redirect() |
                        register() |
                        report() |
                        roomname() |
                        roster_coverimg() |
                        roster_designation() |
                        roster_email() |
                        roster_image() |
                        roster_item() |
                        roster_mobilenumber() |
                        roster_name() |
                        roster_nickname() |
                        roster_notification() |
                        roster_profile() |
                        roster_query() |
                        roster_status() |
                        roster_vcard() |
                        rosterver_feature() |
                        rsm_first() |
                        rsm_set() |
                        sasl_abort() |
                        sasl_auth() |
                        sasl_challenge() |
                        sasl_failure() |
                        sasl_mechanisms() |
                        sasl_response() |
                        sasl_success() |
                        search() |
                        search_item() |
                        'see-other-host'() |
                        seen() |
                        service() |
                        services() |
                        shim() |
                        sic() |
                        sm_a() |
                        sm_enable() |
                        sm_enabled() |
                        sm_failed() |
                        sm_r() |
                        sm_resume() |
                        sm_resumed() |
                        stanza_error() |
                        stanza_id() |
                        starttls() |
                        starttls_failure() |
                        starttls_proceed() |
                        stat() |
                        stat_error() |
                        stats() |
                        stream_error() |
                        stream_features() |
                        stream_start() |
                        streamhost() |
                        text() |
                        thumbnail() |
                        time() |
                        timestampmsg() |
                        unblock() |
                        upload_file_too_large() |
                        upload_request() |
                        upload_request_0() |
                        upload_retry() |
                        upload_slot() |
                        upload_slot_0() |
                        user_activities() |
                        user_fav() |
                        users() |
                        vcard_adr() |
                        vcard_coverimg() |
                        vcard_designation() |
                        vcard_email() |
                        vcard_emailid() |
                        vcard_geo() |
                        vcard_image() |
                        vcard_key() |
                        vcard_label() |
                        vcard_logo() |
                        vcard_mobile_number() |
                        vcard_name() |
                        vcard_nickName() |
                        vcard_org() |
                        vcard_photo() |
                        vcard_sound() |
                        vcard_status() |
                        vcard_tel() |
                        vcard_temp() |
                        vcard_xupdate() |
                        version() |
                        x509_ca_list() |
                        x509_cert_chain() |
                        x509_challenge() |
                        x509_challenge_failed() |
                        x509_csr() |
                        x509_register() |
                        x509_request() |
                        x509_revoke() |
                        x_conference() |
                        xcaptcha() |
                        xdata() |
                        xdata_field() |
                        xdata_option() |
                        xevent() |
                        xmpp_session().
