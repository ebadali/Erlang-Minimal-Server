-module(server_tests).

-export([start/0]).

start() ->

% 1. Functional (functionality, post get responces; End user's pres.)
% 2. EUnit and Integration (ORM to DB and DB to ORM etc .Dev's pres.)

	boss_web_test:get_request("/home/list", [], 		
	        [ % We are checking for some basic information here, loading ok, presence of links and form elements
	            fun boss_assert:http_ok/1
	        ],
	        []),
	boss_web_test:post_request("/transactions/record", [],[<<{"userId": "21", "currencyFrom": "EUR", "currencyTo": "GBP", "amountSell": 1000, "amountBuy": 747.10, 
			"rate": 0, "timePlaced" : "24-JAN-15 10:27:44", "originatingCountry" : "FR"}>>], 		
	        [ % We are checking for some basic information here, loading ok, presence of links and form elements
	            fun boss_assert:http_ok/1
	        ],
	        []).

	        % [ % Here are the continuations, once we've passed the first check for completeness
	    %% No continuations just yet …        
	        % ]).
