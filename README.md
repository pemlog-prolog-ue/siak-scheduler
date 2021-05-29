## SIAK-NG Fasilkom UI Scheduler

Dibuat menggunakan konsep pemrograman logika dengan bahasa Prolog.

Dibuat oleh:
- Athallah Annafis ([athallahannafis](https://github.com/athallahannafis))
- Bunga Amalia K. ([bungamaku](https://github.com/bungamaku))
- Edward Partogi G. A. ([edwardpartogi](https://github.com/edwardpartogi))

Data (Fakta):
1. Mahasiswa = mahasiswa(m_01, 'Athallah Annafis') 
2. Dosen = dosen(d_01, 'Edward Partogi, Ph.D.')
3. Mata Kuliah = mata_kuliah(mk_01, 'Matematika Diskret 1')
4. Kelas = kelas(k_01, mk_01, ‘A’)
5. Dosen Kelas = dosen_kelas(k_01, d_01)
6. Jadwal Kelas = jadwal_kelas(k_01, senin, 8, 0, 9, 40) -> hari, jam mulai, menit mulai, jam selesai, menit selesai
7. Prasyarat = prasyarat(mk_10, [mk_01, mk_03, mk_09])
8. Kapasitas = kapasitas_kelas(k_01, 55, 0) -> kapasitas total, kapasitas yang sudah terisi

Syarat Mutlak:
1. Mahasiswa mengambil mata kuliah yang tidak bentrok jadwalnya, tidak ada lebih dari 1 mata kuliah pada 1 waktu
2. Mahasiswa tidak mengambil mata kuliah dengan jumlah SKS yang melebihi keinginannya
3. Mahasiswa hanya dapat mengambil mata kuliah yang prasyaratnya terpenuhi

Syarat Tambahan:
1. Mahasiswa tidak mengambil kelas yang sudah melebihi kapasitasnya
2. Mahasiswa mengambil kelas yang sesuai dengan preferensi dosen (jika ada)
3. Mahasiswa mengambil kelas yang sesuai dengan preferensi teman kelas (jika ada)
4. Mahasiswa mengambil kelas minat yang sesuai dengan preferensi mata kuliah (jika ada)

Contoh Query:

> cari_jadwal(m_10, 'Bunga Amalia', 20, [d_01, d_02], [m_01, m_02], [mk_01, mk_02], [k_001, k_002, k_003, k_004, k_005])

1. ID dan nama mahasiswa
3. Jumlah SKS yang ingin diambil
1. Preferensi dosen (opsional)
2. Preferensi teman kelas (opsional)
3. Preferensi mata kuliah (opsional)
4. Jadwal kuliah