% Database SIAK Scheduler

% mahasiswa/2
% /1 : id mahasiswa
% /2 : nama mahasiswa

mahasiswa(m_01, 'Frank Dominguez').
mahasiswa(m_02, 'James Garza').
mahasiswa(m_03, 'William Santana').
mahasiswa(m_04, 'Thomas Hale').
mahasiswa(m_05, 'Joseph Tyler').
mahasiswa(m_06, 'Robert Mcdowell').
mahasiswa(m_07, 'Edward Olsen').
mahasiswa(m_08, 'George Riley').
mahasiswa(m_09, 'Charles Vaughn').
mahasiswa(m_10, 'John Hensley').
mahasiswa(m_11, 'Marie Crawford').
mahasiswa(m_12, 'Ruth Holt').
mahasiswa(m_13, 'Dorothy Wiley').
mahasiswa(m_14, 'Mary Glover').
mahasiswa(m_15, 'Margaret Sears').
mahasiswa(m_16, 'Anna Goodman').
mahasiswa(m_17, 'Mildred Bartlett').
mahasiswa(m_18, 'Alice Lara').
mahasiswa(m_19, 'Elizabeth Romero').
mahasiswa(m_20, 'Helen Rhodes').

% matakuliah/2
% /1 : id mata kuliah
% /2 : nama mata kuliah

mata_kuliah(mk_01, 'Aljabar Linier').
mata_kuliah(mk_02, 'Analisis Numerik').
mata_kuliah(mk_03, 'Basis Data').
mata_kuliah(mk_04, 'Dasar-Dasar Pemrograman 1').
mata_kuliah(mk_05, 'Dasar-Dasar Pemrograman 2').
mata_kuliah(mk_06, 'Desain dan Analisis Algoritma').
mata_kuliah(mk_07, 'Grafika Komputer').
mata_kuliah(mk_08, 'Jaringan Komputer').
mata_kuliah(mk_09, 'Kalkulus 1').
mata_kuliah(mk_10, 'Kalkulus 2').
mata_kuliah(mk_11, 'Kerja Praktik').
mata_kuliah(mk_12, 'Komputer dan Masyarakat').
mata_kuliah(mk_13, 'Kriptografi dan Keamanan Informasi').
mata_kuliah(mk_14, 'Layanan dan Aplikasi Web').
mata_kuliah(mk_15, 'Logika Komputasional').
mata_kuliah(mk_16, 'Matematika Diskret 2').
mata_kuliah(mk_17, 'Matematika Diskret 1').
mata_kuliah(mk_18, 'Metodologi Penelitian dan Penulisan Ilmiah').
mata_kuliah(mk_19, 'MPK Olahraga Bola Basket').
mata_kuliah(mk_20, 'MPK Olahraga Bola Voli').
mata_kuliah(mk_21, 'MPK Olahraga Futsal').
mata_kuliah(mk_22, 'MPK Olahraga Sepakbola').
mata_kuliah(mk_23, 'MPK Olahraga Tenis').
mata_kuliah(mk_24, 'MPK Olahraga Tenis Meja').
mata_kuliah(mk_25, 'MPK Terintegrasi').
mata_kuliah(mk_26, 'Pemelajaran Mesin').
mata_kuliah(mk_27, 'Pemrograman Kompetitif').
mata_kuliah(mk_28, 'Pemrograman Lanjut').
mata_kuliah(mk_29, 'Pemrograman Logika').
mata_kuliah(mk_30, 'Pemrograman Paralel').
mata_kuliah(mk_31, 'Pengantar Organisasi Komputer').
mata_kuliah(mk_32, 'Pengantar Sistem Digital').
mata_kuliah(mk_33, 'Pengolahan Bahasa Manusia').
mata_kuliah(mk_34, 'Perancangan dan Pemrograman Web').
mata_kuliah(mk_35, 'Persamaan Diferensial').
mata_kuliah(mk_36, 'Proyek Perangkat Lunak').
mata_kuliah(mk_37, 'Robotika').
mata_kuliah(mk_38, 'Sains Data').
mata_kuliah(mk_39, 'Sistem Cerdas').
mata_kuliah(mk_40, 'Sistem Interaksi').
mata_kuliah(mk_41, 'Sistem Operasi').
mata_kuliah(mk_42, 'Sistem Operasi untuk Sistem Informasi').
mata_kuliah(mk_43, 'Statistika dan Probabilitas').
mata_kuliah(mk_44, 'Struktur Data dan Algoritma').
mata_kuliah(mk_45, 'Teori Bahasa dan Automata').

% prasyarat/2
% /1 : id mata kuliah
% /2 : list prasyarat mata kuliah

prasyarat(mk_02, [mk_01, mk_10]).
prasyarat(mk_03, [mk_05]).
prasyarat(mk_05, [mk_04]).
prasyarat(mk_06, [mk_44]).
prasyarat(mk_07, [mk_01, mk_44]).
prasyarat(mk_08, [mk_41, mk_04]).
prasyarat(mk_10, [mk_09]).
prasyarat(mk_13, [mk_08, mk_43, mk_17, mk_16]).
prasyarat(mk_14, [mk_08, mk_34]).
prasyarat(mk_15, [mk_39]).
prasyarat(mk_26, [mk_39]).
prasyarat(mk_28, [mk_05]).
prasyarat(mk_29, [mk_04, mk_17]).
prasyarat(mk_30, [mk_41, mk_01, mk_10, mk_05]).
prasyarat(mk_31, [mk_32]).
prasyarat(mk_33, [mk_45, mk_39]).
prasyarat(mk_34, [mk_04]).
prasyarat(mk_35, [mk_01, mk_10]).
prasyarat(mk_37, [mk_31, mk_39]).
prasyarat(mk_38, [mk_01, mk_43]).
prasyarat(mk_40, [mk_34]).
prasyarat(mk_41, [mk_31]).
prasyarat(mk_43, [mk_09, mk_17]).
prasyarat(mk_45, [mk_16, mk_17]).

% kelas/3
% /1 = id kelas
% /2 = mata kuliah
% /3 = nama kelas

% alin
kelas(k_001,mk_01,'A').
kelas(k_002,mk_01,'B').
kelas(k_003,mk_01,'C').
kelas(k_004,mk_01,'D').

% anum
kelas(k_005,mk_02,'A').
kelas(k_006,mk_02,'B').

% basdat
kelas(k_007,mk_03,'A').
kelas(k_008,mk_03,'B').
kelas(k_009,mk_03,'C').
kelas(k_010,mk_03,'D').
kelas(k_011,mk_03,'E').
kelas(k_012,mk_03,'F').

% ddp1
kelas(k_013,mk_04,'-').

% ddp2
kelas(k_014,mk_05,'A').
kelas(k_015,mk_05,'B').
kelas(k_016,mk_05,'C').
kelas(k_017,mk_05,'D').
kelas(k_018,mk_05,'E').
kelas(k_019,mk_05,'F').
kelas(k_020,mk_05,'G').

% daa
kelas(k_021,mk_06,'A').
kelas(k_022,mk_06,'B').

% grafkom
kelas(k_023,mk_07,'-').

% jarkom
kelas(k_024,mk_08,'-').

% kalkulus 1
kelas(k_025,mk_09,'-').

% kalkulus 2
kelas(k_026,mk_10,'A').
kelas(k_027,mk_10,'B').
kelas(k_028,mk_10,'C').

% kp
kelas(k_029,mk_11,'-').

% komas
kelas(k_030,mk_12,'A').
kelas(k_031,mk_12,'B').
kelas(k_032,mk_12,'C').

% Kriptografi
kelas(k_033,mk_13,'-').

% LAW
kelas(k_034,mk_14,'A').
kelas(k_035,mk_14,'B').

% logkom
kelas(k_036,mk_15,'-').

% matdis 2
kelas(k_037,mk_16,'A').
kelas(k_038,mk_16,'B').
kelas(k_039,mk_16,'C').
kelas(k_040,mk_16,'E').
kelas(k_041,mk_16,'F').
kelas(k_042,mk_16,'G').

% matdis 1
kelas(k_043,mk_17,'-').

% mppi
kelas(k_044,mk_18,'A').
kelas(k_045,mk_18,'B').
kelas(k_046,mk_18,'C').
kelas(k_047,mk_18,'D').
kelas(k_048,mk_18,'E').

% basket
kelas(k_050,mk_19,'-').

% voli
kelas(k_051,mk_20,'-').

% Futsal
kelas(k_052,mk_21,'-').

% Sepakbola
kelas(k_053,mk_22,'-').

% Tenis
kelas(k_054,mk_23,'-').

% tenis Meja
kelas(k_055,mk_24,'-').

% mpkt a
kelas(k_055,mk_25,'A').
kelas(k_056,mk_25,'B').
kelas(k_057,mk_25,'C').
kelas(k_058,mk_25,'D').
kelas(k_059,mk_25,'E').
kelas(k_060,mk_25,'F').

% pembelajaran mesin
kelas(k_061,mk_26,'-').

% pemrograman kompetitif
kelas(k_062,mk_27,'-').
kelas(k_063,mk_27,'-').
kelas(k_064,mk_27,'-').

% pemrograman lanjut
kelas(k_065,mk_28,'-').

% pemrograman logika
kelas(k_066,mk_29,'-').

% pemrograman paralel
kelas(k_067,mk_30,'-').

% pok
kelas(k_068,mk_31,'A').
kelas(k_069,mk_31,'B').
kelas(k_070,mk_31,'C').

% psd
kelas(k_071,mk_32,'-').

% nlp
kelas(k_072,mk_33,'-').

% ppw
kelas(k_073,mk_34,'-').

% persamaan Diferensial
kelas(k_074,mk_35,'-').

% ppl
kelas(k_075,mk_36,'A').
kelas(k_076,mk_36,'B').
kelas(k_077,mk_36,'C').
kelas(k_078,mk_36,'D').

% robotika
kelas(k_079,mk_37,'-').

% sains data
kelas(k_080,mk_38,'A').
kelas(k_081,mk_38,'B').
kelas(k_082,mk_38,'C').

% SC
kelas(k_083,mk_39,'-').

% sister
kelas(k_084,mk_40,'A').
kelas(k_085,mk_40,'B').
kelas(k_086,mk_40,'C').
kelas(k_087,mk_40,'D').
kelas(k_088,mk_40,'E').

% sistem operasi
kelas(k_089,mk_41,'A').
kelas(k_090,mk_41,'B').
kelas(k_091,mk_41,'C').

% Sistem operasi untuk Sistem informasi
kelas(k_092,mk_42,'A').
kelas(k_093,mk_42,'B').
kelas(k_094,mk_42,'C').

% statprob
kelas(k_095,mk_43,'A').
kelas(k_096,mk_43,'B').
kelas(k_097,mk_43,'C').
kelas(k_098,mk_43,'D').
kelas(k_099,mk_43,'E').
kelas(k_100,mk_43,'F').

% sda
kelas(k_101,mk_44,'A').
kelas(k_102,mk_44,'B').

% tba
kelas(k_103,mk_45,'A').
kelas(k_104,mk_45,'B').
kelas(k_105,mk_45,'C').

% jadwal_kelas/4
% /1 = id kelas
% /2 = hari
% /3 = jam mulai
% /4 = menit mulai
% /5 = jam selesai
% /6 = menit selesai

% alin
jadwal_kelas(k_001, senin, 17, 0, 17, 50).
jadwal_kelas(k_001, rabu, 8, 0, 10, 30).
jadwal_kelas(k_002, senin, 17, 0, 17, 50).
jadwal_kelas(k_002, jumat, 8, 0, 10, 30).
jadwal_kelas(k_003, senin, 17, 0, 17, 50).
jadwal_kelas(k_003, rabu, 8, 0, 10, 30).
jadwal_kelas(k_004, senin, 17, 0, 17, 50).
jadwal_kelas(k_004, jumat, 8, 0, 10, 30).

% anum
jadwal_kelas(k_005, senin, 8, 0, 9, 40).
jadwal_kelas(k_005, rabu, 8, 0, 8, 50).
jadwal_kelas(k_006, senin, 10, 0, 11, 40).
jadwal_kelas(k_006, rabu, 9, 0, 9, 50).

% basdat
jadwal_kelas(k_007, selasa, 8, 0, 9, 40).
jadwal_kelas(k_007, kamis, 8, 0, 9, 40).
jadwal_kelas(k_008, selasa, 8, 0, 9, 40).
jadwal_kelas(k_008, kamis, 8, 0, 9, 40).
jadwal_kelas(k_009, selasa, 8, 0, 9, 40).
jadwal_kelas(k_009, kamis, 8, 0, 9, 40).
jadwal_kelas(k_010, selasa, 10, 0, 11, 40).
jadwal_kelas(k_010, kamis, 10, 0, 11, 40).
jadwal_kelas(k_011, selasa, 10, 0, 11, 40).
jadwal_kelas(k_011, kamis, 10, 0, 11, 40).
jadwal_kelas(k_012, selasa, 8, 0, 9, 40).
jadwal_kelas(k_012, kamis, 8, 0, 9, 40).

% ddp1
jadwal_kelas(k_013, senin, 10, 0, 11, 40).
jadwal_kelas(k_013, selasa, 16, 0, 17, 40).
jadwal_kelas(k_013, rabu, 10, 0, 11, 40).

% ddp2
jadwal_kelas(k_014, senin, 8, 0, 9, 40).
jadwal_kelas(k_014, selasa, 16, 0, 17, 40).
jadwal_kelas(k_014, rabu, 8, 0, 9, 40).
jadwal_kelas(k_015, senin, 8, 0, 9, 40).
jadwal_kelas(k_015, selasa, 16, 0, 17, 40).
jadwal_kelas(k_015, rabu, 8, 0, 9, 40).
jadwal_kelas(k_016, senin, 8, 0, 9, 40).
jadwal_kelas(k_016, selasa, 16, 0, 17, 40).
jadwal_kelas(k_016, rabu, 8, 0, 9, 40).
jadwal_kelas(k_017, senin, 10, 0, 11, 40).
jadwal_kelas(k_017, selasa, 16, 0, 17, 40).
jadwal_kelas(k_017, rabu, 10, 0, 11, 40).
jadwal_kelas(k_018, senin, 8, 0, 9, 40).
jadwal_kelas(k_018, selasa, 16, 0, 17, 40).
jadwal_kelas(k_018, rabu, 8, 0, 9, 40).
jadwal_kelas(k_019, senin, 10, 0, 11, 40).
jadwal_kelas(k_019, selasa, 16, 0, 17, 40).
jadwal_kelas(k_019, rabu, 10, 0, 11, 40).
jadwal_kelas(k_020, senin, 10, 0, 11, 40).
jadwal_kelas(k_020, selasa, 16, 0, 17, 40).
jadwal_kelas(k_020, rabu, 10, 0, 11, 40).

% daa
jadwal_kelas(k_021, selasa, 8, 0, 9, 40).
jadwal_kelas(k_021, rabu, 10, 0, 11, 40).
jadwal_kelas(k_022, selasa, 8, 0, 9, 40).
jadwal_kelas(k_022, rabu, 10, 0, 11, 40).

% grafkom
jadwal_kelas(k_023, rabu, 15, 0, 15, 50).
jadwal_kelas(k_023, kamis, 15, 0, 16, 40).

% jarkom
jadwal_kelas(k_024, selasa, 10, 0, 11, 40).
jadwal_kelas(k_024, kamis, 10, 0, 11, 40).

% kalkulus 1
jadwal_kelas(k_025, senin, 13, 0, 13, 50).
jadwal_kelas(k_025, kamis, 16, 0, 17, 40).
jadwal_kelas(k_025, jumat, 8, 0, 9, 40).

% kalkulus 2
jadwal_kelas(k_026, senin, 14, 0, 14, 50).
jadwal_kelas(k_026, selasa, 10, 0, 11, 40).
jadwal_kelas(k_026, kamis, 16, 0, 17, 40).
jadwal_kelas(k_027, senin, 14, 0, 14, 50).
jadwal_kelas(k_027, selasa, 10, 0, 11, 40).
jadwal_kelas(k_027, kamis, 16, 0, 17, 40).
jadwal_kelas(k_028, senin, 13, 0, 13, 50).
jadwal_kelas(k_028, selasa, 8, 0, 9, 40).
jadwal_kelas(k_028, kamis, 16, 0, 17, 40).

% kp
jadwal_kelas(k_029, kamis, 10, 0, 12, 0).

% komas
jadwal_kelas(k_030, selasa, 8, 0, 10, 30).
jadwal_kelas(k_031, selasa, 13, 0, 15, 30).
jadwal_kelas(k_032, selasa, 8, 0, 10, 30).

% Kriptografi
jadwal_kelas(k_033, senin, 13, 0, 14, 40).
jadwal_kelas(k_033, kamis, 13, 0, 14, 40).

% LAW
jadwal_kelas(k_034, selasa, 10, 0, 11, 40).
jadwal_kelas(k_034, kamis, 11, 0, 11, 50).
jadwal_kelas(k_035, selasa, 10, 0, 11, 40).
jadwal_kelas(k_035, kamis, 11, 0, 11, 50).

% logkom
jadwal_kelas(k_036, senin, 10, 0, 11, 15).
jadwal_kelas(k_036, rabu, 10, 0, 11, 15).

% matdis 2
jadwal_kelas(k_037, kamis, 8, 0, 10, 30).
jadwal_kelas(k_038, kamis, 8, 0, 10, 30).
jadwal_kelas(k_039, kamis, 8, 0, 10, 30).
jadwal_kelas(k_040, kamis, 13, 0, 15, 30).
jadwal_kelas(k_041, kamis, 13, 0, 15, 30).
jadwal_kelas(k_042, kamis, 13, 0, 15, 30).

% matdis 1
jadwal_kelas(k_043, selasa, 13, 0, 14, 40).
jadwal_kelas(k_043, jumat, 10, 0, 10, 50).

% mppi
jadwal_kelas(k_044, jumat, 8, 0, 10, 30).
jadwal_kelas(k_045, jumat, 8, 0, 10, 30).
jadwal_kelas(k_046, jumat, 8, 0, 10, 30).
jadwal_kelas(k_047, jumat, 8, 0, 10, 30).
jadwal_kelas(k_048, jumat, 8, 0, 10, 30).

% basket
jadwal_kelas(k_050, jumat, 17, 0, 17, 50).

% voli
jadwal_kelas(k_051, selasa, 17, 0, 17, 50).

% Futsal
jadwal_kelas(k_052, rabu, 17, 0, 17, 50).

% Sepakbola
jadwal_kelas(k_053, kamis, 17, 0, 17, 50).

% Tenis
jadwal_kelas(k_054, rabu, 17, 0, 17, 50).

% tenis Meja
jadwal_kelas(k_055, kamis, 17, 0, 17, 50).

% mpkt a
jadwal_kelas(k_055, jumat, 13, 0, 15, 30).
jadwal_kelas(k_056, jumat, 13, 0, 15, 30).
jadwal_kelas(k_057, jumat, 13, 0, 15, 30).
jadwal_kelas(k_058, jumat, 13, 0, 15, 30).
jadwal_kelas(k_059, jumat, 13, 0, 15, 30).
jadwal_kelas(k_060, jumat, 13, 0, 15, 30).

% pembelajaran mesin
jadwal_kelas(k_061, rabu, 14, 0, 16, 30).

% pemrograman kompetitif
jadwal_kelas(k_062, rabu, 14, 0, 16, 30).

% pemrograman lanjut
jadwal_kelas(k_063, senin, 8, 0, 9, 40).
jadwal_kelas(k_063, rabu, 8, 0, 9, 40).
jadwal_kelas(k_064, senin, 10, 0, 11, 40).
jadwal_kelas(k_064, rabu, 10, 0, 11, 40).
jadwal_kelas(k_065, senin, 8, 0, 9, 40).
jadwal_kelas(k_065, rabu, 8, 0, 9, 40).

% pemrograman logika
jadwal_kelas(k_066, senin, 8, 0, 9, 40).
jadwal_kelas(k_066, rabu, 8, 0, 9, 40).

% pemrograman paralel
jadwal_kelas(k_067, senin, 8, 0, 9, 40).
jadwal_kelas(k_067, rabu, 8, 0, 9, 40).

% pok
jadwal_kelas(k_068, selasa, 8, 0, 9, 40).
jadwal_kelas(k_068, kamis, 11, 0, 11, 50).
jadwal_kelas(k_068, jumat, 16, 0, 17, 40).
jadwal_kelas(k_069, selasa, 10, 0, 11, 40).
jadwal_kelas(k_069, kamis, 11, 0, 11, 50).
jadwal_kelas(k_069, jumat, 16, 0, 17, 40).
jadwal_kelas(k_070, selasa, 8, 0, 9, 40).
jadwal_kelas(k_070, kamis, 11, 0, 11, 50).
jadwal_kelas(k_070, jumat, 16, 0, 17, 40).

% psd
jadwal_kelas(k_071, senin, 14, 0, 15, 40).
jadwal_kelas(k_071, selasa, 15, 0, 15, 50).
jadwal_kelas(k_071, rabu, 14, 0, 15, 40).

% nlp
jadwal_kelas(k_072, selasa, 8, 0, 9, 40).
jadwal_kelas(k_072, kamis, 10, 0, 10, 50).

% ppw
jadwal_kelas(k_073, senin, 10, 0, 11, 40).
jadwal_kelas(k_073, rabu, 10, 0, 10, 50).

% persamaan Diferensial
jadwal_kelas(k_074, jumat, 8, 0, 10, 30).

% ppl
jadwal_kelas(k_075, senin, 13, 0, 16, 30).
jadwal_kelas(k_075, selasa, 13, 0, 16, 30).
jadwal_kelas(k_076, senin, 13, 0, 16, 30).
jadwal_kelas(k_076, selasa, 13, 0, 16, 30).
jadwal_kelas(k_077, senin, 13, 0, 16, 30).
jadwal_kelas(k_077, selasa, 13, 0, 16, 30).
jadwal_kelas(k_078, senin, 13, 0, 16, 30).
jadwal_kelas(k_078, selasa, 13, 0, 16, 30).

% robotika
jadwal_kelas(k_079, senin, 16, 0, 17, 30).
jadwal_kelas(k_079, rabu, 16, 0, 17, 40).

% sains data
jadwal_kelas(k_080, kamis, 13, 0, 14, 40).
jadwal_kelas(k_080, jumat, 14, 0, 14, 50).
jadwal_kelas(k_081, kamis, 15, 0, 16, 40).
jadwal_kelas(k_081, jumat, 15, 0, 15, 50).
jadwal_kelas(k_082, kamis, 13, 0, 14, 40).
jadwal_kelas(k_082, jumat, 14, 0, 14, 50).

% SC
jadwal_kelas(k_083, selasa, 8, 0, 9, 40).
jadwal_kelas(k_083, kamis, 8, 0, 9, 40).

% sister
jadwal_kelas(k_084, jumat, 8, 0, 10, 30).
jadwal_kelas(k_085, jumat, 13, 0, 15, 30).
jadwal_kelas(k_086, jumat, 8, 0, 10, 30).
jadwal_kelas(k_087, jumat, 13, 0, 15, 30).
jadwal_kelas(k_088, jumat, 13, 0, 15, 30).

% sistem operasi
jadwal_kelas(k_089, senin, 10, 0, 11, 40).
jadwal_kelas(k_089, rabu, 10, 0, 11, 40).
jadwal_kelas(k_090, senin, 15, 0, 16, 40).
jadwal_kelas(k_090, rabu, 15, 0, 16, 40).
jadwal_kelas(k_091, selasa, 8, 0, 9, 40).
jadwal_kelas(k_091, kamis, 8, 0, 9, 40).

% Sistem operasi untuk Sistem informasi
jadwal_kelas(k_092, selasa, 10, 0, 11, 40).
jadwal_kelas(k_092, kamis, 10, 0, 10, 50).
jadwal_kelas(k_093, selasa, 10, 0, 11, 40).
jadwal_kelas(k_093, kamis, 10, 0, 10, 50).
jadwal_kelas(k_094, selasa, 10, 0, 11, 40).
jadwal_kelas(k_094, kamis, 10, 0, 10, 50).

% statprob
jadwal_kelas(k_095, senin, 13, 0, 14, 40).
jadwal_kelas(k_095, rabu, 14, 0, 14, 50).
jadwal_kelas(k_096, senin, 13, 0, 14, 40).
jadwal_kelas(k_096, rabu, 14, 0, 14, 50).
jadwal_kelas(k_097, senin, 13, 0, 14, 40).
jadwal_kelas(k_097, rabu, 14, 0, 14, 50).
jadwal_kelas(k_098, senin, 15, 0, 16, 40).
jadwal_kelas(k_098, rabu, 15, 0, 15, 50).
jadwal_kelas(k_099, senin, 15, 0, 16, 40).
jadwal_kelas(k_099, rabu, 15, 0, 15, 50).
jadwal_kelas(k_100, senin, 15, 0, 16, 40).
jadwal_kelas(k_100, rabu, 15, 0, 15, 50).

% sda
jadwal_kelas(k_101, senin, 8, 0, 9, 40).
jadwal_kelas(k_101, rabu, 8, 0, 9, 40).
jadwal_kelas(k_102, senin, 8, 0, 9, 40).
jadwal_kelas(k_102, rabu, 8, 0, 9, 40).

% tba
jadwal_kelas(k_103, selasa, 13, 0, 14, 40).
jadwal_kelas(k_103, kamis, 13, 0, 14, 40).
jadwal_kelas(k_104, selasa, 15, 0, 16, 40).
jadwal_kelas(k_104, kamis, 15, 0, 16, 40).
jadwal_kelas(k_105, selasa, 13, 0, 14, 40).
jadwal_kelas(k_105, kamis, 13, 0, 14, 40).