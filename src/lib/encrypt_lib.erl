-module(encrypt_lib).
-compile(export_all).

-define(KEY, <<"abcdefghabcdefgh">>).
-define(IV, <<"12345678abcdefgh">>).
-define(SESSION_ID, "session_id").

encrypt_key(Text)->    
    % Crypt = crypto:aes_cfb_128_encrypt(?KEY, ?IV,  binary:list_to_bin(Text)),
    Crypt = crypto:aes_cfb_128_encrypt(?KEY, ?IV,  Text),
    % io:format("Crypt is ~p~n", [binary_to_list( Crypt)]),
    B64 = base64:encode(Crypt),
    binary_to_list(B64).

decrypt_key(Text)->    
    DecodedEncrypt = base64:decode(Text), 
    DeCrypt = crypto:aes_cfb_128_decrypt(?KEY, ?IV, DecodedEncrypt),
    binary_to_list(DeCrypt).
    % B64 = base64:encode(DeCrypt).
    % io:format("DeCrypt is ~p~n", [DeCrypt]).

hash_password(Password, Salt) ->
    mochihex:to_hex(erlang:md5(Salt ++ Password)).
% Instead Of Storing Flat Password,
% Storing the Hash of it.
hash_for(Email, Password) ->
    % io:format("id ~p and password ~p", [Email,Password]), 
    Salt = mochihex:to_hex(erlang:md5(Email)),
    hash_password(Password, Salt).


