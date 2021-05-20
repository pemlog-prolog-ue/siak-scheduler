% Database mahasiswa
% mahasiswa/2
% /1 : kode mahasiswa
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


% Database mata kuliah
% matakuliah/2
% /1 : kode mata kuliah
% /2 : nama mata kuliah

mata_kuliah(mk_01, 'Aljabar Linier')
mata_kuliah(mk_02, 'Analisis Numerik')
mata_kuliah(mk_03, 'Basis Data')
mata_kuliah(mk_04, 'Dasar-Dasar Pemrograman 1')
mata_kuliah(mk_05, 'Dasar-Dasar Pemrograman 2')
mata_kuliah(mk_06, 'Desain dan Analisis Algoritma')
mata_kuliah(mk_07, 'Grafika Komputer')
mata_kuliah(mk_08, 'Jaringan Komputer')
mata_kuliah(mk_09, 'Kalkulus 1')
mata_kuliah(mk_10, 'Kalkulus 2')
mata_kuliah(mk_11, 'Kerja Praktik')
mata_kuliah(mk_12, 'Komputer dan Masyarakat')
mata_kuliah(mk_13, 'Kriptografi dan Keamanan Informasi')
mata_kuliah(mk_14, 'Layanan dan Aplikasi Web')
mata_kuliah(mk_15, 'Logika Komputasional')
mata_kuliah(mk_16, 'Matematika Diskret 2')
mata_kuliah(mk_17, 'Matematika Diskret 1')
mata_kuliah(mk_18, 'Metodologi Penelitian dan Penulisan Ilmiah')
mata_kuliah(mk_19, 'MPK Olahraga Bola Basket')
mata_kuliah(mk_20, 'MPK Olahraga Bola Voli')
mata_kuliah(mk_21, 'MPK Olahraga Futsal')
mata_kuliah(mk_22, 'MPK Olahraga Sepakbola')
mata_kuliah(mk_23, 'MPK Olahraga Tenis')
mata_kuliah(mk_24, 'MPK Olahraga Tenis Meja')
mata_kuliah(mk_25, 'MPK Terintegrasi')
mata_kuliah(mk_26, 'Pemelajaran Mesin')
mata_kuliah(mk_27, 'Pemrograman Kompetitif')
mata_kuliah(mk_28, 'Pemrograman Lanjut')
mata_kuliah(mk_29, 'Pemrograman Logika')
mata_kuliah(mk_30, 'Pemrograman Paralel')
mata_kuliah(mk_31, 'Pengantar Organisasi Komputer')
mata_kuliah(mk_32, 'Pengantar Sistem Digital')
mata_kuliah(mk_33, 'Pengolahan Bahasa Manusia')
mata_kuliah(mk_34, 'Perancangan dan Pemrograman Web')
mata_kuliah(mk_35, 'Persamaan Diferensial')
mata_kuliah(mk_36, 'Proyek Perangkat Lunak')
mata_kuliah(mk_37, 'Robotika')
mata_kuliah(mk_38, 'Sains Data')
mata_kuliah(mk_39, 'Sistem Cerdas')
mata_kuliah(mk_40, 'Sistem Interaksi')
mata_kuliah(mk_41, 'Sistem Operasi')
mata_kuliah(mk_42, 'Sistem Operasi untuk Sistem Informasi')
mata_kuliah(mk_43, 'Statistika dan Probabilitas')
mata_kuliah(mk_44, 'Struktur Data dan Algoritma')
mata_kuliah(mk_45, 'Teori Bahasa dan Automata')

% Database prasyarat mata kuliah
% prasyarat/2
% /1 : kode mata kuliah
% /2 : list prasyarat mata kuliah

prasyarat(mk_02, [mk_01, mk_10])
prasyarat(mk_03, [mk_05])
prasyarat(mk_05, [mk_04])
prasyarat(mk_06, [mk_44])
prasyarat(mk_07, [mk_01, mk_44])
prasyarat(mk_08, [mk_41, mk_04])
prasyarat(mk_10, [mk_09])
prasyarat(mk_13, [mk_08, mk_43, mk_17, mk_16])
prasyarat(mk_14, [mk_08, mk_34])
prasyarat(mk_15, [mk_39])
prasyarat(mk_26, [mk_39])
prasyarat(mk_28, [mk_05])
prasyarat(mk_29, [mk_04, mk_17])
prasyarat(mk_30, [mk_41, mk_01, mk_10, mk_05])
prasyarat(mk_31, [mk_32])
prasyarat(mk_33, [mk_45, mk_39])
prasyarat(mk_34, [mk_04])
prasyarat(mk_35, [mk_01, mk_10])
prasyarat(mk_37, [mk_31, mk_39])
prasyarat(mk_38, [mk_01, mk_43])
prasyarat(mk_40, [mk_34])
prasyarat(mk_41, [mk_31])
prasyarat(mk_43, [mk_09, mk_17])
prasyarat(mk_45, [mk_16, mk_17])
