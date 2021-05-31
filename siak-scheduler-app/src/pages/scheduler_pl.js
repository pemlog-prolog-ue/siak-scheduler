
export const scheduler_pl = `


:- dynamic(bentrok/2).
:- dynamic(list_kelas_sudah_terpilih/1).

% cari_jadwal(m_10, 'Bunga Amalia', 20, [d_01, d_02], [m_01, m_02], [mk_01, mk_02], [mk_03, mk_04], [k_001, k_002, k_003, k_004, k_005])

% cari_jadwal(IDMahasiswa, NamaMahasiswa, SKS, PrefDosen, PrefTeman, PrefMataKuliah, ListMataKuliahSudahLulus, HasilJadwal).
    % \+bentrok(PrefMataKuliah).

cek_list_kelas_tidak_bentrok([_]).
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
    bagof(IDMataKuliah, (memenuhi_prasyarat(IDMataKuliah, ListMataKuliahSudahLulus), 
    \+member(IDMataKuliah, ListMataKuliahSudahLulus)), ListMataKuliahBisaDiambil).

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

semua_list_kelas_terpilih(_, _, _, _, []) :- !.
semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambil, TotalSKS, ListKelasTerpilih, _):-
    kelas_sesuai_sks(BatasSKS, ListKelasBisaDiambil, TotalSKS, ListKelasTerpilih, 0, []),
    findall(ListKelasPernahTerpilih, list_kelas_sudah_terpilih(ListKelasPernahTerpilih), SemuaListKelasPernahTerpilih),
    \+pernah_terpilih(ListKelasTerpilih, SemuaListKelasPernahTerpilih),
    assertz(list_kelas_sudah_terpilih(ListKelasTerpilih)).
semua_list_kelas_terpilih(BatasSKS, [KelasA | SisaListKelasBisaDiambil], TotalSKS, ListKelasTerpilih, [_|ListTemporary]):-
    append(SisaListKelasBisaDiambil, [KelasA], ListKelasBisaDiambil),
    semua_list_kelas_terpilih(BatasSKS, ListKelasBisaDiambil, TotalSKS, ListKelasTerpilih, ListTemporary).

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
`