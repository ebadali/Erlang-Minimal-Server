-module(currencyfair_server_home_controller, [Req]).
-compile(export_all).

% -------------------- Get Requests ----------------

% Lists All the Transactions, 
% Read From Mnesia Tables and render it on the template
list('GET',[])->
	Transaction = boss_db:find(transaction, []),

    {ok, [{transactions, Transaction}]}.
% Handles 404 Error
nope('GET',[])->
	io:format("Inside Nope route ~p~n",[]),
	responce_lib:failure("Invalid Request.").

% Handles 500 Internal Error
oops('GET',[])->
	io:format("Inside Oops route ~p~n",[]),
	responce_lib:failure("We are Sorry, Mishapes Happens.").	

