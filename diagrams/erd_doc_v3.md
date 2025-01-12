# Dokumentasi ERD (Entity Relationship Diagram)

Diagram Entitas-Relasi (ERD) adalah representasi visual dari struktur data dalam sistem. ERD digunakan untuk menggambarkan entitas (tabel), atribut (kolom), dan hubungan antara entitas dalam basis data.

## 1. Koleksi Users (Pengguna)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| uid | string | Identifikasi unik untuk setiap pengguna dalam sistem |
| email | string | Alamat email yang digunakan untuk autentikasi |
| display_name | string | Nama yang ditampilkan dalam aplikasi |
| photo_url | string | Tautan ke foto profil pengguna |
| created_time | timestamp | Waktu pembuatan akun pengguna |
| phone_number | string | Nomor telepon untuk kontak |
| kessler | number | Nilai hasil tes Kessler terakhir |
| shortDescription | string | Deskripsi singkat profil pengguna |
| role | string | Peran pengguna (pasien/dokter) |
| title | string | Gelar atau titel pengguna |
| result_kessler | string | Hasil interpretasi tes Kessler |
| result_time | timestamp | Waktu pengambilan tes Kessler terakhir |
| waktu_pengukuran | array<timestamp> | Daftar waktu pengambilan tes Kessler |
| spesialisasi | string | Bidang spesialisasi (untuk dokter) |
| pengalaman | number | Lama pengalaman praktik (untuk dokter) |
| availableHours | array<string> | Jadwal ketersediaan dokter |
| isDoctorAvailable | boolean | Status ketersediaan dokter |
| deskripsiDokter | string | Deskripsi lengkap profil dokter |

## 2. Koleksi Sessions (Sesi Konsultasi)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| sessionId | string | Identifikasi unik untuk setiap sesi konsultasi |
| patientId | string | Identifikasi pengguna yang menjadi pasien |
| doctorId | string | Identifikasi pengguna yang menjadi dokter |
| startTime | timestamp | Waktu mulai sesi konsultasi |
| endTime | timestamp | Waktu berakhir sesi konsultasi |
| status | string | Status sesi (berlangsung/selesai/dibatalkan) |
| notes | string | Catatan hasil konsultasi |
| createdAt | timestamp | Waktu pembuatan sesi |
| bookingId | string | Identifikasi booking yang terkait |
| doctorName | string | Nama dokter yang melakukan konsultasi |
| reviewRating | number | Nilai rating yang diberikan |
| reviewNotes | string | Catatan ulasan dari pasien |

## 3. Koleksi Bookings (Pemesanan)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| bookingId | string | Identifikasi unik untuk setiap pemesanan |
| patientId | string | Identifikasi pasien yang memesan |
| doctorId | string | Identifikasi dokter yang dipesan |
| patientName | string | Nama pasien yang memesan |
| doctorName | string | Nama dokter yang dipesan |
| date | timestamp | Tanggal konsultasi |
| time | string | Waktu konsultasi |
| notes | string | Catatan tambahan pemesanan |
| status | string | Status pemesanan |
| videoCallUrl | string | Tautan untuk video call |
| createdAt | timestamp | Waktu pembuatan pemesanan |
| updatedAt | timestamp | Waktu terakhir pembaruan pemesanan |

## 4. Koleksi Kessler (Hasil Tes)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| assessmentId | string | Identifikasi unik untuk setiap tes |
| patientId | string | Identifikasi pasien yang mengambil tes |
| hasil_kessler | number | Skor hasil tes K-10 |
| waktu_riwayat | timestamp | Waktu pengambilan tes |

## 5. Koleksi Jurnal (Catatan Harian)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| jurnalId | string | Identifikasi unik untuk setiap jurnal |
| patientId | string | Identifikasi pasien penulis jurnal |
| detail | string | Isi catatan jurnal |
| judul | string | Judul catatan jurnal |
| date_time | timestamp | Waktu penulisan jurnal |
| email | string | Email pasien penulis jurnal |
| created_time | timestamp | Waktu pembuatan jurnal |
| slider_value | number | Nilai tingkat stres (1-10) |

## 6. Koleksi Reviews (Ulasan)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| reviewId | string | Identifikasi unik untuk setiap ulasan |
| sessionId | string | Identifikasi sesi yang diulas |
| rating | number | Nilai rating yang diberikan (1-5) |
| review | string | Isi ulasan |
| createdAt | timestamp | Waktu pembuatan ulasan |
| patientName | string | Nama pasien pemberi ulasan |

## Hubungan Antar Koleksi

1. Users dengan Sessions:
   - Satu pengguna (dokter) dapat memiliki banyak sesi konsultasi
   - Satu pengguna (pasien) dapat memiliki banyak sesi konsultasi

2. Users dengan Bookings:
   - Satu pengguna (pasien) dapat membuat banyak pemesanan
   - Satu pengguna (dokter) dapat menerima banyak pemesanan

3. Users dengan Kessler:
   - Satu pengguna (pasien) dapat memiliki banyak hasil tes Kessler

4. Users dengan Jurnal:
   - Satu pengguna (pasien) dapat menulis banyak jurnal

5. Sessions dengan Reviews:
   - Satu sesi konsultasi dapat menerima banyak ulasan

6. Bookings dengan Sessions:
   - Satu pemesanan akan menciptakan satu sesi konsultasi
