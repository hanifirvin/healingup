# Dokumentasi ERD (Entity Relationship Diagram)

Diagram Entitas-Relasi (ERD) adalah representasi visual dari struktur data dalam sistem. ERD digunakan untuk menggambarkan entitas (tabel), atribut (kolom), dan hubungan antara entitas dalam basis data.

## USERS
Tabel ini menyimpan data pengguna aplikasi, termasuk pasien dan dokter yang menggunakan sistem.

Tabel 3.1 Users
| No | Atribut | Keterangan |
|-----|----------|------------|
| 1 | uid | Identifikasi unik untuk setiap pengguna dalam sistem |
| 2 | email | Alamat email yang digunakan untuk autentikasi |
| 3 | display_name | Nama yang ditampilkan dalam aplikasi |
| 4 | photo_url | Tautan ke foto profil pengguna |
| 5 | created_time | Waktu pembuatan akun pengguna |
| 6 | phone_number | Nomor telepon untuk kontak |
| 7 | kessler | Nilai hasil tes Kessler terakhir |
| 8 | shortDescription | Deskripsi singkat profil pengguna |
| 9 | role | Peran pengguna (pasien/dokter) |
| 10 | title | Gelar atau titel pengguna |
| 11 | result_kessler | Hasil interpretasi tes Kessler |
| 12 | result_time | Waktu pengambilan tes Kessler terakhir |
| 13 | waktu_pengukuran | Daftar waktu pengambilan tes Kessler |
| 14 | spesialisasi | Bidang spesialisasi (untuk dokter) |
| 15 | pengalaman | Lama pengalaman praktik (untuk dokter) |
| 16 | availableHours | Jadwal ketersediaan dokter |
| 17 | isDoctorAvailable | Status ketersediaan dokter |
| 18 | deskripsiDokter | Deskripsi lengkap profil dokter |

## SESSIONS
Tabel ini menyimpan data sesi konsultasi antara pasien dan dokter.

Tabel 3.2 Sessions
| No | Atribut | Keterangan |
|-----|----------|------------|
| 1 | sessionId | Identifikasi unik untuk setiap sesi konsultasi |
| 2 | patientId | Identifikasi pengguna yang menjadi pasien |
| 3 | doctorId | Identifikasi pengguna yang menjadi dokter |
| 4 | startTime | Waktu mulai sesi konsultasi |
| 5 | endTime | Waktu berakhir sesi konsultasi |
| 6 | status | Status sesi (berlangsung/selesai/dibatalkan) |
| 7 | notes | Catatan hasil konsultasi |
| 8 | createdAt | Waktu pembuatan sesi |
| 9 | bookingId | Identifikasi booking yang terkait |
| 10 | doctorName | Nama dokter yang melakukan konsultasi |
| 11 | reviewRating | Nilai rating yang diberikan |
| 12 | reviewNotes | Catatan ulasan dari pasien |

## BOOKINGS
Tabel ini menyimpan data pemesanan jadwal konsultasi.

Tabel 3.3 Bookings
| No | Atribut | Keterangan |
|-----|----------|------------|
| 1 | bookingId | Identifikasi unik untuk setiap pemesanan |
| 2 | patientId | Identifikasi pasien yang memesan |
| 3 | doctorId | Identifikasi dokter yang dipesan |
| 4 | patientName | Nama pasien yang memesan |
| 5 | doctorName | Nama dokter yang dipesan |
| 6 | date | Tanggal konsultasi |
| 7 | time | Waktu konsultasi |
| 8 | notes | Catatan tambahan pemesanan |
| 9 | status | Status pemesanan |
| 10 | videoCallUrl | Tautan untuk video call |
| 11 | createdAt | Waktu pembuatan pemesanan |
| 12 | updatedAt | Waktu terakhir pembaruan pemesanan |

## KESSLER
Tabel ini menyimpan hasil tes Kessler Psychological Distress Scale (K-10).

Tabel 3.4 Kessler
| No | Atribut | Keterangan |
|-----|----------|------------|
| 1 | assessmentId | Identifikasi unik untuk setiap tes |
| 2 | patientId | Identifikasi pasien yang mengambil tes |
| 3 | hasil_kessler | Skor hasil tes K-10 |
| 4 | waktu_riwayat | Waktu pengambilan tes |

## JURNAL
Tabel ini menyimpan catatan jurnal harian pasien.

Tabel 3.5 Jurnal
| No | Atribut | Keterangan |
|-----|----------|------------|
| 1 | jurnalId | Identifikasi unik untuk setiap jurnal |
| 2 | patientId | Identifikasi pasien penulis jurnal |
| 3 | detail | Isi catatan jurnal |
| 4 | judul | Judul catatan jurnal |
| 5 | date_time | Waktu penulisan jurnal |
| 6 | email | Email pasien penulis jurnal |
| 7 | created_time | Waktu pembuatan jurnal |
| 8 | slider_value | Nilai tingkat stres (1-10) |

## REVIEWS
Tabel ini menyimpan ulasan pasien terhadap sesi konsultasi.

Tabel 3.6 Reviews
| No | Atribut | Keterangan |
|-----|----------|------------|
| 1 | reviewId | Identifikasi unik untuk setiap ulasan |
| 2 | sessionId | Identifikasi sesi yang diulas |
| 3 | rating | Nilai rating yang diberikan (1-5) |
| 4 | review | Isi ulasan |
| 5 | createdAt | Waktu pembuatan ulasan |
| 6 | patientName | Nama pasien pemberi ulasan |

## Hubungan Antar Tabel
1. USERS dengan SESSIONS:
   - Satu pengguna (dokter) dapat memiliki banyak sesi konsultasi
   - Satu pengguna (pasien) dapat memiliki banyak sesi konsultasi

2. USERS dengan BOOKINGS:
   - Satu pengguna (pasien) dapat membuat banyak pemesanan
   - Satu pengguna (dokter) dapat menerima banyak pemesanan

3. USERS dengan KESSLER:
   - Satu pengguna (pasien) dapat memiliki banyak hasil tes Kessler

4. USERS dengan JURNAL:
   - Satu pengguna (pasien) dapat menulis banyak jurnal

5. SESSIONS dengan REVIEWS:
   - Satu sesi konsultasi dapat menerima banyak ulasan

6. BOOKINGS dengan SESSIONS:
   - Satu pemesanan akan menciptakan satu sesi konsultasi
