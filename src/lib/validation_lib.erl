-module(validation_lib).
-compile(export_all).

hash_password(Password, Salt) ->
    mochihex:to_hex(erlang:md5(Salt ++ Password)).

hash_for(Name, Password) ->
    Salt = mochihex:to_hex(erlang:md5(Name)),
    hash_password(Password, Salt).



validate_user() ->
	true.