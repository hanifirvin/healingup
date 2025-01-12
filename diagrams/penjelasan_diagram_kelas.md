# Penjelasan Diagram Kelas Aplikasi Healing Up

## Kelas Dasar (Base Classes)
1. **FirestoreRecord**
   - Kelas dasar abstrak untuk semua record database
   - Menyediakan fungsi dasar untuk interaksi dengan Firestore
   - Memiliki referensi dokumen dan data dalam bentuk Map

2. **StatefulWidget dan State**
   - Kelas dasar Flutter untuk widget yang dapat berubah state-nya
   - Mengatur siklus hidup dan pembaruan tampilan widget

## Kelas Model (Model Classes)

### 1. UsersRecord (Data Pengguna)
Menyimpan informasi pengguna baik pasien maupun dokter:
- Email dan nama pengguna
- Foto profil dan UID
- Nomor telepon
- Skor Kessler dan hasil pengukuran
- Deskripsi singkat dan peran
- Untuk dokter: spesialisasi, pengalaman, jam tersedia, dan status ketersediaan

### 2. SessionsRecord (Data Sesi Konseling)
Mencatat detail sesi konseling:
- ID sesi dan waktu mulai/selesai
- Status dan catatan sesi
- ID booking dan ID pasien/dokter
- Nama dokter
- Rating dan catatan review

### 3. BookingRecord (Data Pemesanan)
Mengelola jadwal konseling:
- Tanggal dan waktu booking
- Catatan dan status booking
- URL video call
- Waktu pembuatan dan pembaruan
- Detail pasien dan dokter

### 4. KesslerRecord (Data Pengukuran Kessler)
Menyimpan hasil pengukuran psikologis:
- Skor hasil Kessler
- Waktu pengukuran
- ID pasien

### 5. JurnalRecord (Data Jurnal)
Mengelola catatan harian pasien:
- Detail dan judul jurnal
- Waktu pembuatan
- Nilai slider (tingkat perasaan)
- ID pasien dan jurnal

### 6. ReviewsRecord (Data Ulasan)
Menyimpan ulasan sesi konseling:
- Rating (nilai)
- Isi review
- Waktu pembuatan
- Nama pasien

## Kelas Widget
1. **AgoraVideoCallWidget**
   - Menangani fungsi video call
   - Mengatur koneksi dan tampilan video call

2. **FFAppState**
   - Mengelola state aplikasi secara global
   - Menyimpan pencarian terbaru dan referensi pengguna
   - Mengatur parameter pernapasan

## Hubungan Antar Kelas (Kardinalitas)

### Hubungan One-to-Many (1-ke-Banyak):
1. **User - Sessions**
   - Satu pengguna dapat memiliki banyak sesi konseling
   - Satu dokter dapat menangani banyak sesi

2. **User - Bookings**
   - Satu pengguna dapat membuat banyak booking
   - Satu dokter dapat menerima banyak booking

3. **User - Kessler**
   - Satu pengguna dapat memiliki banyak hasil pengukuran Kessler

4. **User - Jurnal**
   - Satu pengguna dapat membuat banyak entri jurnal

### Hubungan One-to-One (1-ke-1):
1. **Session - Review**
   - Setiap sesi konseling dapat memiliki satu ulasan

2. **Booking - Session**
   - Setiap booking menciptakan satu sesi konseling

## Pewarisan (Inheritance)
1. Semua kelas record (UsersRecord, SessionsRecord, dll.) mewarisi dari FirestoreRecord
2. AgoraVideoCallWidget mewarisi dari StatefulWidget
3. _AgoraVideoCallWidgetState mewarisi dari State

Diagram kelas ini menggambarkan struktur lengkap aplikasi Healing Up, menunjukkan bagaimana berbagai komponen berinteraksi satu sama lain, dengan manajemen pengguna dan sesi konseling sebagai inti dari sistem.
