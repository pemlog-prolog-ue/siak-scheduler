## SIAK-NG Fasilkom UI Scheduler

Dibuat menggunakan konsep pemrograman logika dengan bahasa Prolog.

Dibuat oleh:
- Athallah Annafis ([athallahannafis](https://github.com/athallahannafis))
- Bunga Amalia K. ([bungamaku](https://github.com/bungamaku))
- Edward Partogi G. A. ([edwardpartogi](https://github.com/edwardpartogi))

Data (Fakta):
1. Mahasiswa = mahasiswa(m_01, ‘Athallah Annafis’) 
2. Dosen = dosen(d_01, ‘Ari Saptawijaya, Ph.D.’)
3. Mata Kuliah = mata_kuliah(mk_01, ‘Matematika Diskret 1’)
4. Kelas = kelas(k_01, mk_01, ‘A’)
5. Dosen Kelas = dosen_kelas(k_01, d_01)
6. Jadwal Kelas = jadwal_kelas(k_01, senin, 8, 10) -> hari, jam mulai, jam selesai
7. Prasyarat = prasyarat(mk_10, [mk_01, mk_03, mk_09])
8. Kapasitas = kapasitas(k_01, 55, 0) -> kapasitas maks, kapasitas saat ini
9. Syarat Lulus Mahasiswa (total: 144, wajib, fakultas, minat)
10. IP Semester Sebelumnya -> SKS Maksimal Mahasiswa (float)
11. Preferensi Dosen (A mau ambil kelas dosen B, prioritas 1)
12. Preferensi Teman Kelas (A mau sekelas sama B, prioritas 1)
13. Preferensi Minat (coding, desain, data, dll)
14. Tags Topik Mata Kuliah (coding, desain, data, dll)
15. Sertifikasi (software engineer, data, hardware)

Syarat Mutlak:
1. Mahasiswa mengambil mata kuliah yang tidak bentrok jadwalnya, tidak ada lebih dari 1 mata kuliah pada 1 waktu
2. Mahasiswa mengambil mata kuliah wajib dan peminatan sesuai dengan syarat lulus yang berlaku (minimal SKS wajib dan peminatan)
3. Mahasiswa hanya dapat mengambil mata kuliah yang prasyaratnya terpenuhi

Syarat Tambahan:
1. Mahasiswa tidak mengambil mata kuliah dengan total SKS yang melebihi batas maksimal SKS (tergantung IP semester sebelumnya), kecuali ada syarat khusus harus mengambil SKS lebih agar tidak di-DO (Lebih dari 24 SKS lulus dalam satu tahun ajaran)
2. Mahasiswa tidak mengambil kelas yang sudah melebihi kapasitasnya
3. Mahasiswa mengambil kelas yang sesuai dengan preferensi dosen (jika ada)
4. Mahasiswa mengambil kelas yang sesuai dengan preferensi teman kelas (jika ada)
5. Mahasiswa mengambil kelas minat yang sesuai dengan preferensi minat (jika ada)
6. Mahasiswa mengambil kelas yang dapat memenuhi syarat sertifikasi (jika ada)
