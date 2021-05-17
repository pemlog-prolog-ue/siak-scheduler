## SIAK-NG Fasilkom UI Scheduler

Dibuat menggunakan konsep pemrograman logika dengan bahasa Prolog.

Dibuat oleh:
- Athallah Annafis ((athallahannafis)[https://github.com/athallahannafis])
- Bunga Amalia K. ((bungamaku)[https://github.com/bungamaku])
- Edward Partogi G. A. ((edwardpartogi)[https://github.com/edwardpartogi])

Data (Facts):
1. Nama Mahasiswa
2. Data Kelas Mata Kuliah (Format (nama mata kuliah, nama dosen): Logkom-A, L. Yohanes Stefanus, Senin 10.00 s.d 11.40)
3. Syarat Lulus Mahasiswa (total: 144, wajib: …, fakultas: …, minat: …)
4. Prasyarat Mata Kuliah (Gamedev syaratnya SDA, DDP, Matdis 1, Matdis 2)
5. IP Semester Sebelumnya -> SKS Maksimal Mahasiswa (float)
6. Kapasitas Kelas Mata Kuliah (integer)
7. Preferensi Dosen (A mau ambil kelas dosen B, prioritas 1)
8. Preferensi Teman Kelas (A mau sekelas sama B, prioritas 1)
9. Preferensi Minat (coding, desain, data, dll)
10. Tags Topik Mata Kuliah (coding, desain, data, dll)
11. Sertifikasi (software engineer, data, hardware)

Hard Constraints:
1. Mahasiswa mengambil mata kuliah yang tidak bentrok jadwalnya, tidak ada lebih dari 1 mata kuliah pada 1 waktu
2. Mahasiswa mengambil mata kuliah wajib dan peminatan sesuai dengan syarat lulus yang berlaku (minimal SKS wajib dan peminatan)
3. Mahasiswa hanya dapat mengambil mata kuliah yang prasyaratnya terpenuhi

Soft Constraints:
1. Mahasiswa tidak mengambil mata kuliah dengan total SKS yang melebihi batas maksimal SKS (tergantung IP semester sebelumnya), kecuali ada syarat khusus harus mengambil SKS lebih agar tidak di-DO (Lebih dari 24 SKS lulus dalam satu tahun ajaran)
2. Mahasiswa tidak mengambil kelas yang sudah melebihi kapasitasnya
3. Mahasiswa mengambil kelas yang sesuai dengan preferensi dosen (jika ada)
4. Mahasiswa mengambil kelas yang sesuai dengan preferensi teman kelas (jika ada)
5. Mahasiswa mengambil kelas minat yang sesuai dengan preferensi minat (jika ada)
6. Mahasiswa mengambil kelas yang dapat memenuhi syarat sertifikasi (jika ada)
