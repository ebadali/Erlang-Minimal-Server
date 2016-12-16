-module(transaction, [Id, UserId, CurrencyFrom, CurrencyTo, AmountSell, AmountBuy, Rate, TimePlaced, OriginatingCountry]).
-compile(export_all).


% This is a validation test: Will be called whenever object:save is called.
% Performs Basic Sanity Check
validation_tests() ->

    [{fun() -> length(UserId) > 0 end,
            "invalid UserI d"},
        {fun() -> length(CurrencyFrom) > 0 end,
            "invalid Currency From"},
	    {fun() -> length(CurrencyTo) > 0 end,
            "invalid Currency To"},
        {fun() -> (AmountSell) > 0 end,
            "invalid Amount Sell"},
	    {fun() -> (AmountBuy) > 0 end,
            "invalid Amount Buy"},
        {fun() -> (Rate) > 0 end,
            "invalid Rate"},
	    {fun() -> length(TimePlaced) > 0 end,
            "invalid Time Placed"},
	    {fun() -> length(OriginatingCountry) > 0 end,
            "invalid Originating Country"}].

