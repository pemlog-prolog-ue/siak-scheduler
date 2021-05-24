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