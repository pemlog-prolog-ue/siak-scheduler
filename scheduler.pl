:- use_module(database).
:- use_module(library(http/json_convert)).
:- dynamic bentrok/2.
:- dynamic semua_list_kelas_sudah_terpilih/1.
:- dynamic info_list_kelas_sudah_terpilih/2.

list_info_kelas([], []).
list_info_kelas([KelasA | KelasLainnya], [InfoKelasA | InfoKelasLainnya]):-
    % Cek identitas kelas
    kelas(KelasA, MataKuliah, KodeKelasA), mata_kuliah(MataKuliah, NamaMataKuliah, SKSMataKuliah),
    % Nama Kelas, ex : "DDP 1 - A"
    atomic_list_concat([NamaMataKuliah, KodeKelasA], ' - ', NamaKelasA),

    % Kumpulan Nama Dosen untuk 1 kelas
    findall(NamaDosenKelasA,
        (dosen_kelas(KelasA, DosenKelasA), dosen(DosenKelasA, NamaDosenKelasA)),
    BagNamaDosenKelasA),
    
    % Kumpulan Jadwal untuk 1 kelas
    findall([HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA],
        jadwal_kelas(KelasA, HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA),
    BagJadwalA),
    jadwal_to_string(BagJadwalA, JadwalAString),

    % Menyimpan semua info ke satu functor info_kelas/4
    InfoKelasA = info_kelas(NamaKelasA, BagNamaDosenKelasA, SKSMataKuliah, JadwalAString),
    list_info_kelas(KelasLainnya, InfoKelasLainnya).

jadwal_to_string([], []).
jadwal_to_string([[Hari, JamMulai, MenitMulai, JamSelesai, MenitSelesai] | JadwalLainnya], [Jadwal1String | JadwalStringLainnya]):-
    atomics_to_string([JamMulai, MenitMulai], '.', JamMenitMulai),
    atomics_to_string([JamSelesai, MenitSelesai], '.', JamMenitSelesai),
    Jadwal1String = [Hari, JamMenitMulai, JamMenitSelesai],
    jadwal_to_string(JadwalLainnya, JadwalStringLainnya).
    
% ----------------------------------------------------------------------------------------------------

jadwal_sesuai(BatasSKS, ListMataKuliahSudahLulus):-
    retractall(semua_list_kelas_sudah_terpilih(_)), assertz(semua_list_kelas_sudah_terpilih([])),
    retractall(info_list_kelas_sudah_terpilih(_,_)),
    mata_kuliah_bisa_diambil(ListMataKuliahSudahLulus, ListMataKuliahBisaDiambil),
    kelas_bisa_diambil(ListMataKuliahBisaDiambil, ListKelasBisaDiambil),
    semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambil, ListKelasBisaDiambil).

cek_1_kelas_tidak_bentrok_dengan_list_kelas(_, []).
cek_1_kelas_tidak_bentrok_dengan_list_kelas(KelasA, [KelasB | KelasSisa]) :-
    tidak_bentrok_kelas(KelasA, KelasB),
    cek_1_kelas_tidak_bentrok_dengan_list_kelas(KelasA, KelasSisa).

tidak_bentrok_kelas(KelasA, KelasB):-
    bentrok(KelasA, KelasB), !, false.
tidak_bentrok_kelas(KelasA, KelasB):-
    % Cek info kelas dan jadwalnya
    kelas(KelasA, MataKuliah1, _),
    kelas(KelasB, MataKuliah2, _),

    % Syarat 1 : Mata Kuliah berbeda
    MataKuliah1 \== MataKuliah2,

    % Cek info jadwal dari kelas A dan B
    bagof([HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA],
        jadwal_kelas(KelasA, HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA),
    BagJadwalA),
    bagof([HariKelasB, JamMulaiKelasB, MenitMulaiKelasB, JamSelesaiKelasB, MenitSelesaiKelasB],
        jadwal_kelas(KelasB, HariKelasB, JamMulaiKelasB, MenitMulaiKelasB, JamSelesaiKelasB, MenitSelesaiKelasB),
    BagJadwalB),

    % Syarat 2 : seluruh jadwal kelas A tidak bentrok dengan seluruh jadwal kelas B
    tidak_bentrok_jadwal(BagJadwalA, BagJadwalB), !.
tidak_bentrok_kelas(KelasA, KelasB):-
    assertz(bentrok(KelasA, KelasB)), false.

tidak_bentrok_jadwal([], _) :- !.
tidak_bentrok_jadwal([JadwalA1 | JadwalASisa], BagJadwalB):-
    % Cek JadwalA1 ke semua JadwalB
    cek_1_jadwal(JadwalA1, BagJadwalB),

    % Rekursif cek ke semua JadwalA
    tidak_bentrok_jadwal(JadwalASisa, BagJadwalB).

cek_1_jadwal(_, []).
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

% Memeriksa mata kuliah yang memenuhi syarat : memenuhi Prasyarat Mata Kuliah dan Belum pernah lulus
mata_kuliah_bisa_diambil(ListMataKuliahSudahLulus, ListMataKuliahBisaDiambil) :-
    bagof(IDMataKuliah,
        (
            memenuhi_prasyarat(IDMataKuliah, ListMataKuliahSudahLulus), % Mata kuliah yang prasyaratnya terpenuhi
            \+member(IDMataKuliah, ListMataKuliahSudahLulus)            % Mata kuliah yang belum lulus
        ),
        ListMataKuliahBisaDiambil).

% Mengambil semua kelas dari mata kuliah yang diberikan
kelas_bisa_diambil([], []).
kelas_bisa_diambil([MataKuliahBisaDiambilA | MataKuliahBisaDiambilSisa], ListKelasBisaDiambil) :-
    bagof(IDKelas, NamaKelas^(kelas(IDKelas, MataKuliahBisaDiambilA, NamaKelas)), ListKelasBisaDiambilA),
    append(ListKelasBisaDiambilA, ListKelasBisaDiambilSisa, ListKelasBisaDiambil),
    kelas_bisa_diambil(MataKuliahBisaDiambilSisa, ListKelasBisaDiambilSisa).

% Memeriksa solusi sudah pernah terpilih, walaupun berbeda urutan
pernah_terpilih(_, []) :- false.
pernah_terpilih(ListKelas, [ListKelasPernahTerpilih | _]):-
    msort(ListKelas, ListKelasTerurut), msort(ListKelasPernahTerpilih, ListKelasTerurut), !.
pernah_terpilih(ListKelas, [_| ListKelasPernahTerpilihLainnya]):-
    pernah_terpilih(ListKelas, ListKelasPernahTerpilihLainnya).

semua_list_kelas_terpilih(_, [_|_], []) :- !.
semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambil, [_|ListTemporary]):-
    % Cari 1 solusi susunan kelas yang memenuhi
    kelas_sesuai_sks(BatasSKS, ListKelasBisaDiambil, TotalSKS, ListKelasTerpilih, 0, []),

    % Memeriksa apakah solusi baru sudah pernah terpilih
    semua_list_kelas_sudah_terpilih(SemuaListKelasPernahTerpilih),
    \+pernah_terpilih(ListKelasTerpilih, SemuaListKelasPernahTerpilih), !,

    % Simpan ke kumpulan solusi baru di dynamic semua_list_kelas_sudah_terpilih/1
    append(SemuaListKelasPernahTerpilih, [ListKelasTerpilih], SemuaListKelasTerpilihBaru),
    retractall(semua_list_kelas_sudah_terpilih(_)), assertz(semua_list_kelas_sudah_terpilih(SemuaListKelasTerpilihBaru)),

    % Menyimpan info dari solusi baru memakai dynamic info_list_kelas_sudah_terpilih/2
    list_info_kelas(ListKelasTerpilih, ListKelasTerpilih_Info),
    assertz(info_list_kelas_sudah_terpilih(TotalSKS, ListKelasTerpilih_Info)),

    % Mengganti urutan ListKelasBisaDiambil untuk mencari kemungkinan solusi baru
    ListKelasBisaDiambil = [KelasA | SisaListKelasBisaDiambil],
    append(SisaListKelasBisaDiambil, [KelasA], ListKelasBisaDiambilBaru),
    semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambilBaru, ListTemporary).
semua_list_kelas_terpilih(BatasSKS, [KelasA | SisaListKelasBisaDiambil], [_|ListTemporary]):-
    % Mengganti urutan ListKelasBisaDiambil untuk mencari kemungkinan solusi baru
    append(SisaListKelasBisaDiambil, [KelasA], ListKelasBisaDiambilBaru),
    semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambilBaru, ListTemporary).


% Untuk mendapatkan susunan kelas-kelas yang mungkin diambil, selama tidak saling bentrok dan tidak melewati batas SKS yang diberikan
% Rule dijalankan secara rekursif, dengan memperhatikan 3 kasus :
%     1. Tidak ada lagi Kelas yang dijadikan pilihan (Base Case)
%     2. Jika masih ada Kelas yang menjadi pilihan, dan
%         - SKS kelas tersebut tidak melewati batas SKS,
%         - kelas tersebut tidak menimbulkan jadwal bentrok.
%     3. Jika Kelas yang menjadi pilihan tidak memenuhi syarat pada kasus 2

kelas_sesuai_sks(_, [], 0, [], _, _).
kelas_sesuai_sks(BatasSKS, [KelasBisaDiambilA | SisaKelasBisaDiambil], TotalSKSDiambil, KelasMemenuhi, SKSTemporary, ListTemporary):-
    % Ambil info Mata Kuliah
    kelas(KelasBisaDiambilA, MataKuliah, _),
    mata_kuliah(MataKuliah, _, SKSMataKuliah),
    
    % Periksa SKS dan Bentrok
    BatasSKS >= SKSTemporary+SKSMataKuliah,
    cek_1_kelas_tidak_bentrok_dengan_list_kelas(KelasBisaDiambilA, ListTemporary), !,

    % Menambahkan SKS Mata Kuliah yang memenuhi ke akumulator SKSTemporaryBerikutnya
    SKSTemporaryBerikutnya is SKSTemporary+SKSMataKuliah,

    % Menambahkan Kelas yang memenuhi ke akumulator KelasTemporaryBerikutnya
    append([KelasBisaDiambilA], ListTemporary, ListTemporaryBerikutnya),

    % Memisahkan Kelas yang memenuhi dengan KelasMemenuhiLainnya
    append([KelasBisaDiambilA], KelasMemenuhiLainnya, KelasMemenuhi),

    kelas_sesuai_sks(BatasSKS, SisaKelasBisaDiambil, SKSKelasMemenuhiLainnya, KelasMemenuhiLainnya, SKSTemporaryBerikutnya, ListTemporaryBerikutnya),
    
    % Memisahkan SKS Mata Kuliah yang memenuhi dengan SKSKelasMemenuhiLainnya
    TotalSKSDiambil is SKSKelasMemenuhiLainnya+SKSMataKuliah.
kelas_sesuai_sks(BatasSKS, [_ | SisaKelasBisaDiambil], TotalSKSDiambil, KelasMemenuhi, SKSTemporary, ListTemporary):-
    kelas_sesuai_sks(BatasSKS, SisaKelasBisaDiambil, TotalSKSDiambil, KelasMemenuhi, SKSTemporary, ListTemporary).

convert_to_atom([],[]).
convert_to_atom([A | B], [X | Y]) :-
	atom_string(X, A),
	convert_to_atom(B, Y).