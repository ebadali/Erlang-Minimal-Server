	
-module(app_tests).
-include_lib("eunit/include/eunit.hrl").
 
%%%============================================================================
%%% API
%%%============================================================================
 
suite_test_()->
    Suite =
    {foreach, local,
      fun setup/0,
      tests()
     },
    Suite.
 
tests() ->
    [       
     {"Validations of full_name",
      ?_test(validate_transaction())},
     {"Validations of generated_dates",
      ?_test(validate_success_transaction())}
    ].
 
validate_transaction() ->
    Transaction = boss_record:new(transaction, []),
    %% First/Last Name is required
    ?assertEqual({error, [{user_id, "Mat8657"}, {currency_from, "EUR"}, {currency_to, "GPB"}]}, Transaction:save()),
    Transaction2 = Transaction:set([{time_placed, "2015-10-19 18:00"}, {originating_country, "US"}]),
    {Res, _} = Transaction2:save(),
    ?assertEqual(ok, Res).

validate_success_transaction() ->
    Transaction = boss_record:new(transaction, [{id, id},{user_id, "John1213"}, {currency_from, "EUR"},
      {currency_to, "GPB"}, {amount_sell, "1200.98"},{amount_buy, "28.98"}, {rate, "20"},
      {time_placed, "2016-11-19 18:00"}, {originating_country, "IR"}]),
    ?assertEqual("John1213", Transaction:user_id()).
 
     
 %% ===================================================================
%% Internal functions
%% ===================================================================
 
%%--------------------------------------------------------------------
%% @doc Setup each test set
%%--------------------------------------------------------------------
setup()->
    ok.