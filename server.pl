:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
% :- use_module(react_router). % the custom router
:- use_module(siak_api). % api definitions for the demo.

% Start the server using a custom router that will allow both api,
% static files and the react router to work together nicely.
server(Port) :-
   http_server(http_dispatch, [port(Port)]).

