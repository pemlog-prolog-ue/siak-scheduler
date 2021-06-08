:- use_module(database).
:- use_module(library(http/json_convert)).
:- dynamic bentrok/2.
:- dynamic semua_list_kelas_sudah_terpilih/1.
:- dynamic info_list_kelas_sudah_terpilih/2.

%  BUAT NAFIS
:- json_object info_kelas(nama_kelas:atom, nama_dosen:list, sks:integer, jadwal:list).
:- json_object info_list_kelas_sudah_terpilih(sks:integer, semua_jadwal:list(info_kelas/4)).

list_info_kelas([], []) :- !.
list_info_kelas([KelasA | KelasLainnya], [InfoKelasA | InfoKelasLainnya]):-
    kelas(KelasA, MataKuliah, KodeKelasA), mata_kuliah(MataKuliah, NamaMataKuliah, SKSMataKuliah),
    atomic_list_concat([NamaMataKuliah, KodeKelasA], ' ', NamaKelasA),

    findall(NamaDosenKelasA,
        (dosen_kelas(KelasA, DosenKelasA), dosen(DosenKelasA, NamaDosenKelasA)),
    BagNamaDosenKelasA),
    
    findall([HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA],
        jadwal_kelas(KelasA, HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA),
    BagJadwalA),
    jadwal_to_string(BagJadwalA, JadwalAString),

    InfoKelasA = info_kelas(NamaKelasA, BagNamaDosenKelasA, SKSMataKuliah, JadwalAString),
    list_info_kelas(KelasLainnya, InfoKelasLainnya).

jadwal_to_string([], []):- !.
jadwal_to_string([[Hari, JamMulai, MenitMulai, JamSelesai, MenitSelesai] | JadwalLainnya], [Jadwal1String | JadwalStringLainnya]):-
    atomics_to_string([JamMulai, MenitMulai], '.', JamMenitMulai),
    atomics_to_string([JamSelesai, MenitSelesai], '.', JamMenitSelesai),
    Jadwal1String = [Hari, JamMenitMulai, JamMenitSelesai],
    jadwal_to_string(JadwalLainnya, JadwalStringLainnya).
    
    
% jadwal_sesuai(IDMahasiswa, NamaMahasiswa, BatasSKS, PrefDosen, PrefTeman, PrefMataKuliah, ListMataKuliahSudahLulus):-
jadwal_sesuai(BatasSKS, ListMataKuliahSudahLulus):-
    write("Nafis carry us"),
    retractall(semua_list_kelas_sudah_terpilih(_)), assertz(semua_list_kelas_sudah_terpilih([])),
    retractall(info_list_kelas_sudah_terpilih(_,_)),
    mata_kuliah_bisa_diambil(ListMataKuliahSudahLulus, ListMataKuliahBisaDiambil),
    kelas_bisa_diambil(ListMataKuliahBisaDiambil, ListKelasBisaDiambil),
    semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambil, ListKelasBisaDiambil).

cek_list_kelas_tidak_bentrok([_]) :- !.
cek_list_kelas_tidak_bentrok([KelasA | KelasSisa]) :-
    cek_1_kelas_tidak_bentrok_dengan_list_kelas(KelasA, KelasSisa),
    cek_list_kelas_tidak_bentrok(KelasSisa).

cek_1_kelas_tidak_bentrok_dengan_list_kelas(_, []).
cek_1_kelas_tidak_bentrok_dengan_list_kelas(KelasA, [KelasB | KelasSisa]) :-
    tidak_bentrok_kelas(KelasA, KelasB),
    cek_1_kelas_tidak_bentrok_dengan_list_kelas(KelasA, KelasSisa).

tidak_bentrok_kelas(KelasA, KelasB):-
    bentrok(KelasA, KelasB), !, false.
tidak_bentrok_kelas(KelasA, KelasB):-
    % Cek kelas dan jadwalnya
    kelas(KelasA, MataKuliah1, _),
    kelas(KelasB, MataKuliah2, _),
    MataKuliah1 \== MataKuliah2,
    bagof([HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA],
        jadwal_kelas(KelasA, HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA),
    BagJadwalA),
    bagof([HariKelasB, JamMulaiKelasB, MenitMulaiKelasB, JamSelesaiKelasB, MenitSelesaiKelasB],
        jadwal_kelas(KelasB, HariKelasB, JamMulaiKelasB, MenitMulaiKelasB, JamSelesaiKelasB, MenitSelesaiKelasB),
    BagJadwalB),
    % Cek kelas tidak bentrok untuk seluruh jadwal
    tidak_bentrok_jadwal(BagJadwalA, BagJadwalB), !.
tidak_bentrok_kelas(KelasA, KelasB):-
    assertz(bentrok(KelasA, KelasB)), false.

tidak_bentrok_jadwal([], _) :- !.
tidak_bentrok_jadwal([JadwalA1 | JadwalASisa], BagJadwalB):-
    % Cek JadwalA1 ke semua JadwalB
    cek_1_jadwal(JadwalA1, BagJadwalB),

    % Rekursif cek ke semua JadwalA
    tidak_bentrok_jadwal(JadwalASisa, BagJadwalB).

cek_1_jadwal(_, []) :- !.
cek_1_jadwal([HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA],
    [[HariKelasB, JamMulaiKelasB, MenitMulaiKelasB, JamSelesaiKelasB, MenitSelesaiKelasB] | JadwalBSisa]):-
    % Cek bentrok di hari yang sama
    HariKelasA == HariKelasB , !,

    % Konversi jadwal ke menit
    konversi_jadwal(JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA, TotalMenitMulaiKelasA, TotalMenitSelesaiKelasA),
    konversi_jadwal(JamMulaiKelasB, MenitMulaiKelasB, JamSelesaiKelasB, MenitSelesaiKelasB, TotalMenitMulaiKelasB, TotalMenitSelesaiKelasB),
    (TotalMenitSelesaiKelasA < TotalMenitMulaiKelasB ; TotalMenitSelesaiKelasB < TotalMenitMulaiKelasA),
    
    % Rekursif cek ke semua JadwalB
    cek_1_jadwal([HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA],
        JadwalBSisa).

cek_1_jadwal(JadwalA, [_ | JadwalBSisa]):-
    cek_1_jadwal(JadwalA, JadwalBSisa).

konversi_jadwal(JamMulai, MenitMulai, JamSelesai, MenitSelesai, TotalMenitMulai, TotalMenitSelesai) :-
    TotalMenitMulai is JamMulai*60+MenitMulai,
    TotalMenitSelesai is JamSelesai*60+MenitSelesai.

memenuhi_prasyarat(MataKuliah, ListMataKuliahSudahLulus) :-
    prasyarat(MataKuliah, ListPrasyaratMataKuliah),
    subset(ListPrasyaratMataKuliah, ListMataKuliahSudahLulus).

mata_kuliah_bisa_diambil(ListMataKuliahSudahLulus, ListMataKuliahBisaDiambil) :-
    bagof(IDMataKuliah,
        (
            memenuhi_prasyarat(IDMataKuliah, ListMataKuliahSudahLulus),
            \+member(IDMataKuliah, ListMataKuliahSudahLulus)
        ),
        ListMataKuliahBisaDiambil).

kelas_bisa_diambil([], []).
kelas_bisa_diambil([MataKuliahBisaDiambilA | MataKuliahBisaDiambilSisa], ListKelasBisaDiambil) :-
    bagof(IDKelas, NamaKelas^(kelas(IDKelas, MataKuliahBisaDiambilA, NamaKelas)), ListKelasBisaDiambilA),
    append(ListKelasBisaDiambilA, ListKelasBisaDiambilSisa, ListKelasBisaDiambil),
    kelas_bisa_diambil(MataKuliahBisaDiambilSisa, ListKelasBisaDiambilSisa).


pernah_terpilih(_, []) :- !, false.
pernah_terpilih(ListKelas, [ListKelasPernahTerpilih | _]):-
    msort(ListKelas, ListKelasTerurut), msort(ListKelasPernahTerpilih, ListKelasTerurut), !.
pernah_terpilih(ListKelas, [_| ListKelasPernahTerpilihLainnya]):-
    pernah_terpilih(ListKelas, ListKelasPernahTerpilihLainnya).

semua_list_kelas_terpilih(_, [_|_], []) :- !.
semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambil, [_|ListTemporary]):-
    kelas_sesuai_sks(BatasSKS, ListKelasBisaDiambil, TotalSKS, ListKelasTerpilih, 0, []),
    semua_list_kelas_sudah_terpilih(SemuaListKelasPernahTerpilih),
    \+pernah_terpilih(ListKelasTerpilih, SemuaListKelasPernahTerpilih), !,

    append(SemuaListKelasPernahTerpilih, [ListKelasTerpilih], SemuaListKelasTerpilihBaru),
    retractall(semua_list_kelas_sudah_terpilih(_)), assertz(semua_list_kelas_sudah_terpilih(SemuaListKelasTerpilihBaru)),
    list_info_kelas(ListKelasTerpilih, ListKelasTerpilih_Info),
    assertz(info_list_kelas_sudah_terpilih(TotalSKS, ListKelasTerpilih_Info)),

    ListKelasBisaDiambil = [KelasA | SisaListKelasBisaDiambil],
    append(SisaListKelasBisaDiambil, [KelasA], ListKelasBisaDiambilBaru),
    semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambilBaru, ListTemporary).
semua_list_kelas_terpilih(BatasSKS, [KelasA | SisaListKelasBisaDiambil], [_|ListTemporary]):-
    append(SisaListKelasBisaDiambil, [KelasA], ListKelasBisaDiambilBaru),
    semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambilBaru, ListTemporary).

kelas_sesuai_sks(_, [], 0, [], _, _) :- !.
kelas_sesuai_sks(BatasSKS, ListKelasBisaDiambil, TotalSKSDiambil, KelasMemenuhi, SKSTemporary, ListTemporary):-
    member(KelasBisaDiambilA, ListKelasBisaDiambil),
    kelas(KelasBisaDiambilA, MataKuliah, _),
    mata_kuliah(MataKuliah, _, SKSMataKuliah),
    BatasSKS >= SKSTemporary+SKSMataKuliah,
    cek_1_kelas_tidak_bentrok_dengan_list_kelas(KelasBisaDiambilA, ListTemporary), !,

    append([KelasBisaDiambilA], KelasMemenuhiLainnya, KelasMemenuhi),
    append([KelasBisaDiambilA], ListTemporary, ListTemporaryBerikutnya),
    SKSTemporaryBerikutnya is SKSTemporary+SKSMataKuliah,
    delete(ListKelasBisaDiambil, KelasBisaDiambilA, SisaKelasBisaDiambil),
    kelas_sesuai_sks(BatasSKS, SisaKelasBisaDiambil, SKSKelasMemenuhiLainnya, KelasMemenuhiLainnya, SKSTemporaryBerikutnya, ListTemporaryBerikutnya),
    TotalSKSDiambil is SKSKelasMemenuhiLainnya+SKSMataKuliah.
kelas_sesuai_sks(BatasSKS, [_ | SisaKelasBisaDiambil], TotalSKSDiambil, KelasMemenuhi, SKSTemporary, ListTemporary):-
    kelas_sesuai_sks(BatasSKS, SisaKelasBisaDiambil, TotalSKSDiambil, KelasMemenuhi, SKSTemporary, ListTemporary).