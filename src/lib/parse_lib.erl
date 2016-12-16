-module(parse_lib).
-compile(export_all).

-define(NOTKNOWN, none).



parse_transaction_payload(Req) ->


	case mochijson2:decode(string:tokens(binary_to_list(Req:request_body()),"&")) of 
		 {struct, JsonData} ->
			case binary_to_list(proplists:get_value(<<"userId">>,JsonData,?NOTKNOWN)) of
				?NOTKNOWN ->
					{error,"Invalid UserID Parameter"};
				UserId ->
					case binary_to_list(proplists:get_value(<<"currencyFrom">>,JsonData,?NOTKNOWN)) of
						?NOTKNOWN ->
							{error,"Invalid CurrencyFrom Parameter"};
						CurrencyFrom ->
							case binary_to_list(proplists:get_value(<<"currencyTo">>,JsonData,?NOTKNOWN)) of
								?NOTKNOWN ->
									{error,"Invalid CurrencyTo Parameter"};
								CurrencyTo ->
									case (proplists:get_value(<<"amountSell">>,JsonData,?NOTKNOWN)) of
										?NOTKNOWN ->
											{error,"Invalid AmountSell Parameter"};											
										AmountSell ->
											case (proplists:get_value(<<"amountBuy">>,JsonData,?NOTKNOWN)) of
												?NOTKNOWN -> 
													{error,"Invalid AmountBuy Parameter"};											
												AmountBuy ->
													case (proplists:get_value(<<"rate">>,JsonData,?NOTKNOWN)) of	 
														?NOTKNOWN ->
															{error,"Invalid rate Parameter"};
														 Rate ->
														 	case binary_to_list(proplists:get_value(<<"timePlaced">>,JsonData,?NOTKNOWN)) of
														 		?NOTKNOWN -> 
														 			{error,"Invalid TimePlaced Parameter"};
														 		TimePlaced ->
														 			case binary_to_list(proplists:get_value(<<"originatingCountry">>,JsonData,?NOTKNOWN)) of
														 				?NOTKNOWN ->
														 					{error, "Invalid OriginatingCountry Parameter"};
														 				OriginatingCountry ->
														 					{ok, transaction:new(id,UserId, CurrencyFrom, CurrencyTo, AmountSell, AmountBuy, 
																					Rate, TimePlaced, OriginatingCountry)}
														 			end
														 	end
													end
											end
									end
							end									
					end				
			end;
		_ ->
			{error,"Invalid Payload"}
	end.

	% case binary_to_list(proplists:get_value(<<"currencyFrom">>,JsonData,?NOTKNOWN)) of
	% 	?NOTKNOWN ->
	% 		sd;
	% 	CurrencyFrom ->
	% 		sd
	% end;

 % 	{struct, JsonData} = mochijson2:decode(string:tokens(binary_to_list(Req:request_body()),"&")),

	% UserId = binary_to_list(proplists:get_value(<<"userId">>,JsonData,?NOTKNOWN)),
	% CurrencyFrom = binary_to_list(proplists:get_value(<<"currencyFrom">>,JsonData,?NOTKNOWN)),		
	% CurrencyTo = binary_to_list(proplists:get_value(<<"currencyTo">>,JsonData,?NOTKNOWN)),
	% % These are real's 
	% AmountSell = (proplists:get_value(<<"amountSell">>,JsonData,?NOTKNOWN)),
	% AmountBuy = (proplists:get_value(<<"amountBuy">>,JsonData,?NOTKNOWN)),	 	 
	% Rate = (proplists:get_value(<<"rate">>,JsonData,?NOTKNOWN)),	 
	% % ---
	% TimePlaced = binary_to_list(proplists:get_value(<<"timePlaced">>,JsonData,?NOTKNOWN)),	 
	% OriginatingCountry = binary_to_list(proplists:get_value(<<"originatingCountry">>,JsonData,?NOTKNOWN)),	

	% TransactionObj = transaction:new(id,UserId, CurrencyFrom, CurrencyTo, AmountSell, AmountBuy, 
	% 	Rate, TimePlaced, OriginatingCountry),
	% io:format("This is the json0 ~p~n",[UserId]),
	% io:format("This is the json0 ~p~n",[CurrencyFrom]),
	% io:format("This is the json0 ~p~n",[AmountSell]),
	% io:format("This is the json0 ~p~n",[Rate]),  	   	   	 

	% % {error, "Some custom Error"}.
	% {ok, TransactionObj}.

% failure(undefined)->
% 	{json,  [{status, ?FAILURE }] };

% failure(Object)->
% 	{json,  [{status, ?FAILURE  }, {error, Object}] }.



