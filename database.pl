% Database SIAK Scheduler

:- module(database, [mahasiswa/2, mata_kuliah/2, prasyarat/2, kelas/3, dosen/2, dosen_kelas/2, kapasitas_kelas/3, jadwal_kelas/6, jadwal_mahasiswa/2]).

% mahasiswa/2
% /1 : ID mahasiswa
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
% /1 : ID mata kuliah
% /2 : nama mata kuliah
% /3 : jumlah SKS mata kuliah

mata_kuliah(mk_01, 'Aljabar Linier', 3).
mata_kuliah(mk_02, 'Analisis Numerik', 3).
mata_kuliah(mk_03, 'Basis Data', 4).
mata_kuliah(mk_04, 'Dasar-Dasar Pemrograman 1', 4).
mata_kuliah(mk_05, 'Dasar-Dasar Pemrograman 2', 4).
mata_kuliah(mk_06, 'Desain dan Analisis Algoritma', 4).
mata_kuliah(mk_07, 'Grafika Komputer', 3).
mata_kuliah(mk_08, 'Jaringan Komputer', 4).
mata_kuliah(mk_09, 'Kalkulus 1', 3).
mata_kuliah(mk_10, 'Kalkulus 2', 3).
mata_kuliah(mk_11, 'Kerja Praktik', 3).
mata_kuliah(mk_12, 'Komputer dan Masyarakat', 3).
mata_kuliah(mk_13, 'Kriptografi dan Keamanan Informasi', 4).
mata_kuliah(mk_14, 'Layanan dan Aplikasi Web', 3).
mata_kuliah(mk_15, 'Logika Komputasional', 3).
mata_kuliah(mk_16, 'Matematika Diskret 2', 3).
mata_kuliah(mk_17, 'Matematika Diskret 1', 3).
mata_kuliah(mk_18, 'Metodologi Penelitian dan Penulisan Ilmiah', 3).
mata_kuliah(mk_19, 'MPK Olahraga Bola Basket', 1).
mata_kuliah(mk_20, 'MPK Olahraga Bola Voli', 1).
mata_kuliah(mk_21, 'MPK Olahraga Futsal', 1).
mata_kuliah(mk_22, 'MPK Olahraga Sepakbola', 1).
mata_kuliah(mk_23, 'MPK Olahraga Tenis', 1).
mata_kuliah(mk_24, 'MPK Olahraga Tenis Meja', 1).
mata_kuliah(mk_25, 'MPK Terintegrasi', 5).
mata_kuliah(mk_26, 'Pemelajaran Mesin', 3).
mata_kuliah(mk_27, 'Pemrograman Kompetitif', 3).
mata_kuliah(mk_28, 'Pemrograman Lanjut', 4).
mata_kuliah(mk_29, 'Pemrograman Logika', 4).
mata_kuliah(mk_30, 'Pemrograman Paralel', 4).
mata_kuliah(mk_31, 'Pengantar Organisasi Komputer', 3).
mata_kuliah(mk_32, 'Pengantar Sistem Digital', 4).
mata_kuliah(mk_33, 'Pengolahan Bahasa Manusia', 3).
mata_kuliah(mk_34, 'Perancangan dan Pemrograman Web', 3).
mata_kuliah(mk_35, 'Persamaan Diferensial', 3).
mata_kuliah(mk_36, 'Proyek Perangkat Lunak', 6).
mata_kuliah(mk_37, 'Robotika', 3).
mata_kuliah(mk_38, 'Sains Data', 3).
mata_kuliah(mk_39, 'Sistem Cerdas', 4).
mata_kuliah(mk_40, 'Sistem Interaksi', 3).
mata_kuliah(mk_41, 'Sistem Operasi', 4).
mata_kuliah(mk_42, 'Sistem Operasi untuk Sistem Informasi', 3).
mata_kuliah(mk_43, 'Statistika dan Probabilitas', 3).
mata_kuliah(mk_44, 'Struktur Data dan Algoritma', 4).
mata_kuliah(mk_45, 'Teori Bahasa dan Automata', 4).
mata_kuliah(mk_46, 'Basis Data Lanjut', 3).

% prasyarat/2
% /1 :ID mata kuliah
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
prasyarat(mk_46, [mk_03]).

% kelas/3
% /1 = ID kelas
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

% pemrograman lanjut
kelas(k_063,mk_28,'A').
kelas(k_064,mk_28,'B').
kelas(k_065,mk_28,'C').

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

% banjut
kelas(k_106,mk_46,'-').

% dosen/2
% /1 = ID dosen
% /2 = nama dosen

dosen(d_01, 'Dr. Dra. Saul James, M.Sc.').
dosen(d_02, 'Dr.Eng. Eleanor Bell, S.Kom., M.Eng.').
dosen(d_03, 'Dr. Jon Ramsey, S.Kom., M.Kom.').
dosen(d_04, 'Prof. Drs. Emilio Washington, M.Sc., Ph.D.').
dosen(d_05, 'Paul Wood, S.Kom., M.Sc.').
dosen(d_06, 'Yolanda Ortega, S.Kom., M.Kom.').
dosen(d_07, 'Cassandra Pope, S.Kom., M.Kom.').
dosen(d_08, 'Rafael Sanchez, S.Kom., M.Kom., Ph.D.').
dosen(d_09, 'Rita Spencer, S.Kom., M.Kom.').
dosen(d_10, 'Crystal Garrett, S.Kom., M.Kom.').
dosen(d_11, 'Drs. Gilbert Yates, M.Math, Ph.D.').
dosen(d_12, 'Dr.Eng. Grace Schwartz, S.Kom., M.Sc.').
dosen(d_13, 'Ruben Holmes, S.Kom., M.Kom.').
dosen(d_14, 'Joyce Holt, S.T., M.Kom.').
dosen(d_15, 'Dean Moran, S.T., M.Sc.').
dosen(d_16, 'Dr.rer.nat. Dorothy Mcdaniel, S.Kom., M.Sc.').
dosen(d_17, 'Dr. Drs. Mattie Cobb, M.Sc.').
dosen(d_18, 'Tammy Moody, S.Si., M.Kom.').
dosen(d_19, 'Nicolas Graves, S.Kom., M.Kom.').
dosen(d_20, 'Leon Abbott, S.Si., M.Si.').
dosen(d_21, 'Prof. Adam Pittman, M.Sc., Ph.D.').
dosen(d_22, 'Sue Flowers, S.Mat., M.Kom.').
dosen(d_23, 'Sally Nguyen, S.Kom., M.Kom., M.Sc.').
dosen(d_24, 'Drs. Jerry Roberts, M.Math, Ph.D.').
dosen(d_25, 'Prof. Dr.Eng. Isabel Sharp, S.T., M.Kom.').
dosen(d_26, 'Bobby Richardson, S.Kom., M.Eng., Ph.D.').
dosen(d_27, 'Ross Ramos, S.Kom., M.Kom.').
dosen(d_28, 'Lauren Farmer, S.Kom., M.Kom.').
dosen(d_29, 'Dra. Essie Phelps, M.Sc., Ph.D.').
dosen(d_30, 'Dr. Byron Griffith, S.Kom., M.Sc.').
dosen(d_31, 'Anna Bailey, S.Kom., M.Kom.').
dosen(d_32, 'Deborah Obrien, S.Kom., M.Kom.').
dosen(d_33, 'Dana Fletcher, S.Kom., M.Sc.').
dosen(d_34, 'Gerald Peters, M.Pd.').
dosen(d_35, 'Billie Stephens').
dosen(d_36, 'Esther Cummings, M.Pd.').
dosen(d_37, 'Ernestine Quinn').
dosen(d_38, 'Dustin Saunders, M.Pd.').
dosen(d_39, 'Alma Garcia').
dosen(d_40, 'Dominick Ryan, M.Pd.').
dosen(d_41, 'Norma Bowman, S.Pd., M.Pd.').
dosen(d_42, 'Angie Hunt, S.Pd.').
dosen(d_43, 'Eric Ross, M.Pd.').
dosen(d_44, 'Cedric Poole, S.Kom., M.Sc.').
dosen(d_45, 'Judith Hill, S.Kom., M.Kom., Ph.D.').
dosen(d_46, 'Mike Hudson, S.Kom., M.Kom.').
dosen(d_47, 'Dr. Ora Townsend, S.Kom., M.Kom.').
dosen(d_48, 'Kayla Drake, M.Sc.').
dosen(d_49, 'Diana Porter, S.Kom., M.I.T., Ph.D.').
dosen(d_50, 'Pat Williamson, S.Kom., M.Kom.').
dosen(d_51, 'Brandi Woods, M.Sc.').
dosen(d_52, 'Nathan Larson, S.Kom., M.Sc., Ph.D.').
dosen(d_53, 'Dr. Ir. Jodi Francis, M.Sc.').
dosen(d_54, 'Ir. Jerald Black, M.Kom.').
dosen(d_55, 'Velma Phillips, S.Kom., M.Hum.').
dosen(d_56, 'Vanessa Gonzalez, S.Kom., M.Sc.').
dosen(d_57, 'Dr. Darlene Peterson, S.Kom.').
dosen(d_58, 'Angelina Cooper, S.Kom., M.Kom.').
dosen(d_59, 'Frankie Hayes, S.Kom., M.Kom.').
dosen(d_60, 'Kendra Medina, S.Kom., M.Kom.').
dosen(d_61, 'Lyle Tyler, S.T., Ph.D.').
dosen(d_62, 'Mary Bush, S.Kom., M.Comp.Sc').
dosen(d_63, 'Michele Casey, S.Kom., M.A.').
dosen(d_64, 'Angel Dennis, M.Kom.').
dosen(d_65, 'Benjamin Christensen, S.Kom., M.Kom.').
dosen(d_66, 'Dr. Jacqueline Johnston, S.Kom., M.Kom.').
dosen(d_67, 'Allison Willis, S.Kom., M.Kom.').
dosen(d_68, 'Casey Moore, S.Kom., M.Sc., M.Kom.').
dosen(d_69, 'Lillie Hines, S.Kom., M.Kom.').
dosen(d_70, 'Ir. Janet Stokes, M.Sc., Ph.D.').
dosen(d_71, 'Ir. Anto Ilija, M.Sc., Ph.D.').

% dosen_kelas/2
% /1 = ID kelas
% /2 = ID dosen

% alin
dosen_kelas(k_001,  d_01).
dosen_kelas(k_002,  d_02).
dosen_kelas(k_003,  d_02).
dosen_kelas(k_004,  d_03).

% anum
dosen_kelas(k_005,  d_04).
dosen_kelas(k_005,  d_05).
dosen_kelas(k_006,  d_04).
dosen_kelas(k_006,  d_05).

% basdat
dosen_kelas(k_007,  d_06).
dosen_kelas(k_008,  d_07).
dosen_kelas(k_009,  d_08).
dosen_kelas(k_010,  d_09).
dosen_kelas(k_011,  d_07).
dosen_kelas(k_012,  d_07).
dosen_kelas(k_012,  d_10).

% ddp2
dosen_kelas(k_014,  d_11).
dosen_kelas(k_015,  d_12).
dosen_kelas(k_016,  d_13).
dosen_kelas(k_017,  d_14).
dosen_kelas(k_018,  d_15).
dosen_kelas(k_019,  d_15).
dosen_kelas(k_020,  d_16).

% daa
dosen_kelas(k_021,  d_17).
dosen_kelas(k_021,  d_18).
dosen_kelas(k_022,  d_05).

% grafkom
dosen_kelas(k_023,  d_19).

% jarkom
dosen_kelas(k_024,  d_13).

% kalkulus 1
dosen_kelas(k_025,  d_04).
dosen_kelas(k_025,  d_20).

% kalkulus 2
dosen_kelas(k_026,  d_21).
dosen_kelas(k_026,  d_20).
dosen_kelas(k_027,  d_22).
dosen_kelas(k_028,  d_22).

% kp
dosen_kelas(k_029,  d_23).

% komas
dosen_kelas(k_030,  d_24).
dosen_kelas(k_031,  d_24).
dosen_kelas(k_032,  d_25).

% Kriptografi
dosen_kelas(k_033,  d_26).

% LAW
dosen_kelas(k_034,  d_27).
dosen_kelas(k_035,  d_27).

% logkom
dosen_kelas(k_036,  d_11).

% matdis 2
dosen_kelas(k_037,  d_28).
dosen_kelas(k_037,  d_29).
dosen_kelas(k_038,  d_29).
dosen_kelas(k_038,  d_14).
dosen_kelas(k_039,  d_29).
dosen_kelas(k_039,  d_18).
dosen_kelas(k_040,  d_18).
dosen_kelas(k_041,  d_14).
dosen_kelas(k_042,  d_28).

% matdis 1
dosen_kelas(k_043,  d_28).

% mppi
dosen_kelas(k_044,  d_30).
dosen_kelas(k_045,  d_30).
dosen_kelas(k_046,  d_31).
dosen_kelas(k_047,  d_12).
dosen_kelas(k_048,  d_32).
dosen_kelas(k_048,  d_33).

% basket
dosen_kelas(k_050,  d_34).
dosen_kelas(k_050,  d_35).

% voli
dosen_kelas(k_051,  d_36).
dosen_kelas(k_051,  d_37).

% Futsal
dosen_kelas(k_052,  d_38).

% Sepakbola
dosen_kelas(k_053,  d_39).
dosen_kelas(k_053,  d_40).

% Tenis
dosen_kelas(k_054,  d_36).
dosen_kelas(k_054,  d_41).

% tenis Meja
dosen_kelas(k_055,  d_42).
dosen_kelas(k_055,  d_43).

% mpkt a
dosen_kelas(k_055,  d_44).
dosen_kelas(k_055,  d_45).
dosen_kelas(k_056,  d_01).
dosen_kelas(k_057,  d_46).
dosen_kelas(k_057,  d_47).
dosen_kelas(k_058,  d_17).
dosen_kelas(k_059,  d_03).
dosen_kelas(k_059,  d_46).
dosen_kelas(k_060,  d_45).
dosen_kelas(k_060,  d_44).

% pembelajaran mesin
dosen_kelas(k_061,  d_48).

% pemrograman kompetitif
dosen_kelas(k_062,  d_49).

% pemrograman lanjut
dosen_kelas(k_063,  d_50).
dosen_kelas(k_064,  d_50).
dosen_kelas(k_064,  d_51).
dosen_kelas(k_065,  d_27).

% pemrograman logika
dosen_kelas(k_066,  d_52).

% pemrograman paralel
dosen_kelas(k_067,  d_46).
dosen_kelas(k_067,  d_21).

% pok
dosen_kelas(k_068,  d_53).
dosen_kelas(k_069,  d_53).
dosen_kelas(k_069,  d_54).
dosen_kelas(k_070,  d_54).

% psd
dosen_kelas(k_071,  d_55).
dosen_kelas(k_071,  d_53).

% nlp
dosen_kelas(k_072,  d_56).

% ppw
dosen_kelas(k_073,  d_55).

% persamaan Diferensial
dosen_kelas(k_074,  d_24).

% ppl
dosen_kelas(k_075,  d_57).
dosen_kelas(k_076,  d_51).
dosen_kelas(k_077,  d_58).
dosen_kelas(k_078,  d_59).

% robotika
dosen_kelas(k_079,  d_25).

% sains data
dosen_kelas(k_080,  d_60).
dosen_kelas(k_081,  d_60).
dosen_kelas(k_082,  d_61).

% SC
dosen_kelas(k_083,  d_62).

% sister
dosen_kelas(k_084,  d_59).
dosen_kelas(k_085,  d_63).
dosen_kelas(k_086,  d_19).
dosen_kelas(k_087,  d_02).
dosen_kelas(k_088,  d_59).

% sistem operasi
dosen_kelas(k_089,  d_64).
dosen_kelas(k_090,  d_64).
dosen_kelas(k_091,  d_64).

% Sistem operasi untuk Sistem informasi
dosen_kelas(k_092,  d_65).
dosen_kelas(k_092,  d_66).
dosen_kelas(k_093,  d_58).
dosen_kelas(k_094,  d_50).

% statprob
dosen_kelas(k_095,  d_61).
dosen_kelas(k_096,  d_67).
dosen_kelas(k_097,  d_62).
dosen_kelas(k_098,  d_62).
dosen_kelas(k_099,  d_67).
dosen_kelas(k_100,  d_61).

% sda
dosen_kelas(k_101,  d_68).
dosen_kelas(k_102,  d_09).

% tba
dosen_kelas(k_103,  d_69).
dosen_kelas(k_104,  d_69).
dosen_kelas(k_104,  d_70).
dosen_kelas(k_105,  d_70).

% banjut
dosen_kelas(k_106,  d_71).

% kapasitas_kelas/3
% /1 = ID kelas
% /2 = kapasitas total
% /3 = kapasitas yang sudah terisi

% alin
kapasitas_kelas(k_001,60,0).
kapasitas_kelas(k_002,70,0).
kapasitas_kelas(k_003,60,0).
kapasitas_kelas(k_004,68,0).

% anum
kapasitas_kelas(k_005,80,0).
kapasitas_kelas(k_006,80,0).

% basdat
kapasitas_kelas(k_007,67,0).
kapasitas_kelas(k_008,69,0).
kapasitas_kelas(k_009,66,0).
kapasitas_kelas(k_010,69,0).
kapasitas_kelas(k_011,69,0).
kapasitas_kelas(k_012,66,0).

% ddp1
kapasitas_kelas(k_013,55,0).

% ddp2
kapasitas_kelas(k_014,60,0).
kapasitas_kelas(k_015,60,0).
kapasitas_kelas(k_016,60,0).
kapasitas_kelas(k_017,60,0).
kapasitas_kelas(k_018,60,0).
kapasitas_kelas(k_019,60,0).
kapasitas_kelas(k_020,60,0).

% daa
kapasitas_kelas(k_021,60,0).
kapasitas_kelas(k_022,60,0).

% grafkom
kapasitas_kelas(k_023,50,0).

% jarkom
kapasitas_kelas(k_024,55,1).

% kalkulus 1
kapasitas_kelas(k_025,71,0).

% kalkulus 2
kapasitas_kelas(k_026,73,0).
kapasitas_kelas(k_027,73,0).
kapasitas_kelas(k_028,65,0).

% kp
kapasitas_kelas(k_029,50,0).

% komas
kapasitas_kelas(k_030,60,0).
kapasitas_kelas(k_031,61,3).
kapasitas_kelas(k_032,60,1).

% Kriptografi
kapasitas_kelas(k_033,50,0).

% LAW
kapasitas_kelas(k_034,60,1).
kapasitas_kelas(k_035,60,1).

% logkom
kapasitas_kelas(k_036,63,4).

% matdis 2
kapasitas_kelas(k_037,69,0).
kapasitas_kelas(k_038,69,0).
kapasitas_kelas(k_039,69,0).
kapasitas_kelas(k_040,69,0).
kapasitas_kelas(k_041,69,0).
kapasitas_kelas(k_042,69,0).

% matdis 1
kapasitas_kelas(k_043,70,0).

% mppi
kapasitas_kelas(k_044,68,0).
kapasitas_kelas(k_045,68,0).
kapasitas_kelas(k_046,68,0).
kapasitas_kelas(k_047,68,0).
kapasitas_kelas(k_048,68,0).

% basket
kapasitas_kelas(k_050,25,0).

% voli
kapasitas_kelas(k_051,25,0).

% Futsal
kapasitas_kelas(k_052,25,0).

% Sepakbola
kapasitas_kelas(k_053,25,0).

% Tenis
kapasitas_kelas(k_054,25,0).

% tenis Meja
kapasitas_kelas(k_055,25,0).

% mpkt a
kapasitas_kelas(k_055,70,0).
kapasitas_kelas(k_056,70,0).
kapasitas_kelas(k_057,70,0).
kapasitas_kelas(k_058,70,0).
kapasitas_kelas(k_059,70,0).
kapasitas_kelas(k_060,70,0).

% pembelajaran mesin
kapasitas_kelas(k_061,60,0).

% pemrograman kompetitif
kapasitas_kelas(k_062,40,0).

% pemrograman lanjut
kapasitas_kelas(k_063,75,0).
kapasitas_kelas(k_064,75,0).
kapasitas_kelas(k_065,75,0).

% pemrograman logika
kapasitas_kelas(k_066,50,4).

% pemrograman paralel
kapasitas_kelas(k_067,50,0).

% pok
kapasitas_kelas(k_068,75,0).
kapasitas_kelas(k_069,78,0).
kapasitas_kelas(k_070,75,0).

% psd
kapasitas_kelas(k_071,50,0).

% nlp
kapasitas_kelas(k_072,50,0).

% ppw
kapasitas_kelas(k_073,60,0).

% persamaan Diferensial
kapasitas_kelas(k_074,50,0).

% ppl
kapasitas_kelas(k_075,50,1).
kapasitas_kelas(k_076,50,0).
kapasitas_kelas(k_077,50,0).
kapasitas_kelas(k_078,50,0).

% robotika
kapasitas_kelas(k_079,50,0).

% sains data
kapasitas_kelas(k_080,60,1).
kapasitas_kelas(k_081,60,0).
kapasitas_kelas(k_082,60,0).

% SC
kapasitas_kelas(k_083,50,0).

% sister
kapasitas_kelas(k_084,71,0).
kapasitas_kelas(k_085,69,1).
kapasitas_kelas(k_086,70,0).
kapasitas_kelas(k_087,68,0).
kapasitas_kelas(k_088,71,0).

% sistem operasi
kapasitas_kelas(k_089,60,0).
kapasitas_kelas(k_090,60,0).
kapasitas_kelas(k_091,64,0).

% Sistem operasi untuk Sistem informasi
kapasitas_kelas(k_092,73,0).
kapasitas_kelas(k_093,73,0).
kapasitas_kelas(k_094,73,0).

% statprob
kapasitas_kelas(k_095,66,0).
kapasitas_kelas(k_096,66,0).
kapasitas_kelas(k_097,69,0).
kapasitas_kelas(k_098,67,0).
kapasitas_kelas(k_099,66,0).
kapasitas_kelas(k_100,66,0).

% sda
kapasitas_kelas(k_101,60,0).
kapasitas_kelas(k_102,60,0).

% tba
kapasitas_kelas(k_103,69,0).
kapasitas_kelas(k_104,65,0).
kapasitas_kelas(k_105,68,0).

% banjut
kapasitas_kelas(k_106,50,2).

% jadwal_kelas/6
% /1 = ID kelas
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

% banjut
jadwal_kelas(k_106, senin, 13, 0, 15, 30).

% jadwal_mahasiswa/2
% /1 = ID mahasiswa
% /2 = list kelas yang dapat diambil

jadwal_mahasiswa(m_01, [k_031, k_035, k_036, k_066]).
jadwal_mahasiswa(m_02, [k_031, k_034, k_036, k_066, k_106]).
jadwal_mahasiswa(m_03, [k_032, k_036, k_066, k_075, k_080, k_085]).
jadwal_mahasiswa(m_02, [k_031, k_024, k_036, k_066, k_106]).