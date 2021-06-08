:- module(siak_api, []).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_cors)).
:- use_module(library(pcre)).

:- set_setting(http:cors, ['*']).

% The web api handlers
:- http_handler(root('api/matkul'), list_matkul, []).
:- http_handler(root('api/query'), query_test, []).
% :- http_handler(root('api/albums'), band_albums, []).

% json converters for the band and album so we can send/receive them on
% the internetz.
:- json_object mata_kuliah(id:atom, nama_matkul:atom, sks:integer).
:- json_object info_kelas(nama_kelas:atom, nama_dosen:atom, sks:integer, jadwal:list).
% :- json_object album(band:atom, name:atom, year:integer).

% need our bands!
:- [database].
:- [scheduler].

% api to get a list of bands, this allows for an optional match
% parameter although it isn't used in the demo.
%
% Will reply with a list of bands based with the name matching the match
% paramter.
list_matkul(Request) :-
	http_parameters(Request,
			[match(Match, [optional(true), default('.*')])]),

	findall(mata_kuliah(Id, Nama, SKS), mata_kuliah(Id, Nama, SKS), List_matkul),
	% jadwal_sesuai(A, Edo, 20, a, a, a, [], KelasSesuai, SKS),
	% info_kelas_string(KelasSesuai,InfoKelasSesuai),
	prolog_to_json(List_matkul, S),
	reply_json(S, []).


% api to get the list of albums for a band, this requires a paramter of
% band which is sent by the react front end.
%
% Will reply with a list of albumns for a band with a name exactly
% matching the band parameter.

query_test(Request) :-
		option(method(options), Request), !,
    cors_enable(Request,
                    [ methods([post])
    ]),
    format(user_output,"Request is: ~p~n",[Request]),
    reply_json_dict(_{message:"Options"}).


query_test(Request) :-
	http_read_json_dict(Request, Data),
	cors_enable( Request, [methods([post]) ]),
	Data = _{graduated:Graduated, sks:SKS},
	format(user_output,"Request is: ~p~n",[SKS]),
	% jadwal_sesuai(m_1706979215, 'Edward Partogi G. A.', SKS, 'Pak Ade', 'Bukan Nafis', 'Gabut', Graduated, KelasMemenuhi, TotalSKSKelasMemenuhi),
	reply_json_dict(Data).

% band_albums(Request) :-
% 	http_parameters(Request, [band(Band, [])]),

% 	findall(album(Band, Album, Year),
% 		band_album(Band, Album, Year),
% 		Albums),

% 	prolog_to_json(Albums, S),
% 	reply_json(S, []).




