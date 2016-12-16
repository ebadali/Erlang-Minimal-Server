-module(responce_lib).
-compile(export_all).

-define(SUCCESS, "success").
-define(FAILURE, "failure").



success(undefined)->
	{json,  [{status, ?SUCCESS }] };
success(Object)->
	% Data = {data, json.encode(Object)},
	{json,  [{status, ?SUCCESS  }, {data, Object}] }.
	% {output, Object}.



failure(undefined)->
	{json,  [{status, ?FAILURE }] };

failure(Object)->
	{json,  [{status, ?FAILURE  }, {error, Object}] }.
