-module(currencyfair_server_transactions_controller, [Req]).
-compile(export_all).
% -rr("erlmongo.hrl").



% -------------------- Post Requests ----------------
% Stores the transaction to the mnesia (disk)


% URL /transactions/record

% Method: GET

% URL Paramsc: None
	
% Data Params: {"userId": "134256", "currencyFrom": "EUR", "currencyTo": "GBP", "amountSell": 1000, "amountBuy": 747.10, "rate": 0.7471, "timePlaced" : "24-JAN-15 10:27:44", "originatingCountry" : "FR"}

% Success Response:  Code: 200 
% Content: List Of Transactions ( Renders to template )

% Error Response: 

% {"status":"failure","error":"invalid {Parameter}"}
% Content: { error : "You are unauthorized to make this request." }


record('POST', []) ->
	 case parse_lib:parse_transaction_payload(Req) of
		{ok,T} -> 	 	
			 case T:save() of
			 	{ok, Trn} ->
			 		Transaction = boss_db:find(transaction, []),					
					{ok, [{transactions, Transaction}]};			
				{error, Err} ->
					responce_lib:failure(lists:flatten(Err))
			end;
		{error, ErrorMsg} ->
			responce_lib:failure(ErrorMsg)
	end.



