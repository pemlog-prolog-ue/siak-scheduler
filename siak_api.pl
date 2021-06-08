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
:- http_handler(root('api/query'), generate_solution, []).
% :- http_handler(root('api/albums'), band_albums, []).

% json converters for the band and album so we can send/receive them on
% the internetz.
:- json_object mata_kuliah(id:atom, nama_matkul:atom, sks:integer).
:- json_object info_kelas(nama_kelas:atom, nama_dosen:list, sks:integer, jadwal:list).
:- json_object info_list_kelas_sudah_terpilih(sks:integer, info_satu_solusi:list(info_kelas/4)).
% :- json_object album(band:atom, name:atom, year:integer).
% {[]}

:- [database].
:- [scheduler].

% GET API SEMUA MATKUL
list_matkul(Request) :-
	http_parameters(Request,
			[match(Match, [optional(true), default('.*')])]),

	findall(mata_kuliah(Id, Nama, SKS), mata_kuliah(Id, Nama, SKS), List_matkul),
	% jadwal_sesuai(A, Edo, 20, a, a, a, [], KelasSesuai, SKS),
	% info_kelas_string(KelasSesuai,InfoKelasSesuai),
	prolog_to_json(List_matkul, S),
	format(user_output,"Request is: ~p~n",[S]),
	reply_json_dict(S).

% api to get the list of albums for a band, this requires a paramter of
% band which is sent by the react front end.
%
% Will reply with a list of albumns for a band with a name exactly
% matching the band parameter.

generate_solution(Request) :-
		option(method(options), Request), !,
    cors_enable(Request,
                    [ methods([post,get,delete,put])
    ]),
    format(user_output,"Request is: ~p~n",[Request]),
    reply_json_dict(_{message:"Options"}).


generate_solution(Request) :-
	http_read_json_dict(Request, Data),
	Data = _{graduated:Graduated, sks:SKS},
	format(user_output,"Request is: ~p~n",[Graduated]),
 	cors_enable(Request,
      [ methods([post,get])
  ]),
% QUERY
	jadwal_sesuai(SKS, Graduated),
	findall(info_list_kelas_sudah_terpilih(JumlahSKS, SusunanKelas),
	info_list_kelas_sudah_terpilih(JumlahSKS, SusunanKelas),
	InfoSemuaKelas),
% QUERY RESULT
	prolog_to_json(InfoSemuaKelas, S),
	format(user_output,"Request is: ~p~n",[S]),
	reply_json(S).

	% format(user_output,"Request is: ~p~n",[Data]),
	% reply_json(_{code:200, message:"OK"}, []).

% band_albums(Request) :-
% 	http_parameters(Request, [band(Band, [])]),

% 	findall(album(Band, Album, Year),
% 		band_album(Band, Album, Year),
% 		Albums),

% 	prolog_to_json(Albums, S),
% 	reply_json(S, []).





