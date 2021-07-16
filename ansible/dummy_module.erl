-module(dummy_module).

-required_variable(#{name=>dummy_var, description=>"dummy_var",
                     default_value=>default_value}).
%% API
-export([some_fn/0]).
some_fn() -> ok.
