-module(util_lib).
-compile(export_all).

list_to_num(N) ->
    case string:to_float(N) of
        {error,no_float} -> 
        	case string:to_integer(N) of
        		{error, no_integer} ->
        			none;
        		{I, _Rest} ->
        			I
        	end;
        {F,_Rest} -> F
    end.