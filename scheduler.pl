:- use_module(database).

%cari_jadwal(m_10, 'Bunga Amalia', 20, [d_01, d_02], [m_01, m_02], [mk_01, mk_02], [k_001, k_002, k_003, k_004, k_005])

cari_jadwal(IDMahasiswa, NamaMahasiswa, SKS, PrefDosen, PrefTeman, PrefMataKuliah).
    % \+bentrok(PrefMataKuliah).

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
    
    tidak_bentrok_jadwal(BagJadwalA, BagJadwalB).

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
    JamMenitMulaiKelasA is JamMulaiKelasA*60+MenitMulaiKelasA,
    JamMenitMulaiKelasB is JamMulaiKelasB*60+MenitMulaiKelasB,
    JamMenitSelesaiKelasA is JamSelesaiKelasA*60+MenitSelesaiKelasA,
    JamMenitSelesaiKelasB is JamSelesaiKelasB*60+MenitSelesaiKelasB,
    (JamMenitSelesaiKelasA < JamMenitMulaiKelasB ; JamMenitSelesaiKelasB < JamMenitMulaiKelasA),
    
    % Rekursif cek ke semua JadwalB
    cek_1_jadwal([HariKelasA, JamMulaiKelasA, MenitMulaiKelasA, JamSelesaiKelasA, MenitSelesaiKelasA],
        JadwalBSisa).

cek_1_jadwal(JadwalA, [_ | JadwalBSisa]):-
    cek_1_jadwal(JadwalA, JadwalBSisa).


% jadwal_mahasiswa(IDMahasiswa, ListKelas):-
%     mahasiswa(IDMahasiswa, NamaMahasiswa),
%     cari_jadwal(IDMahasiswa, NamaMahasiswa, )