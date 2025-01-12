# Dokumentasi Struktur Database Healing Up

## 1. Koleksi Users (Pengguna)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| email | string | Alamat email pengguna |
| display_name | string | Nama yang ditampilkan |
| photo_url | string | URL foto profil |
| uid | string | ID unik pengguna |
| created_time | timestamp | Waktu akun dibuat |
| phone_number | string | Nomor telepon |
| kessler | number | Skor tes Kessler |
| shortDescription | string | Deskripsi singkat |
| last_active_time | timestamp | Waktu terakhir aktif |
| role | string | Peran (pasien/dokter) |
| title | string | Gelar |
| result_kessler | string | Hasil tes Kessler dalam bentuk teks |
| result_time | timestamp | Waktu pengambilan tes Kessler |
| waktu_pengukuran | array<timestamp> | Daftar waktu pengukuran |
| spesialisasi | string | Spesialisasi dokter |
| pengalaman | number | Tahun pengalaman |
| availableHours | array<string> | Jam tersedia |
| isDoctorAvailable | boolean | Status ketersediaan dokter |
| deskripsiDokter | string | Deskripsi profil dokter |

## 2. Koleksi Sessions (Sesi Konseling)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| sessionId | string | ID unik sesi |
| startTime | timestamp | Waktu mulai |
| endTime | timestamp | Waktu selesai |
| status | string | Status sesi |
| notes | string | Catatan sesi |
| createdAt | timestamp | Waktu pembuatan |
| bookingId | string | ID booking |
| patientId | string | ID pasien |
| doctorId | string | ID dokter |
| doctorName | string | Nama dokter |
| reviewRating | number | Rating review |
| reviewNotes | string | Catatan review |

## 3. Koleksi Kessler (Hasil Tes Psikologi)

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| hasil_kessler | number | Nilai hasil tes |
| waktu_riwayat | timestamp | Waktu pengerjaan |
| patientId | string | ID pasien |

## 4. Koleksi Jurnal

| Nama Field | Tipe Data | Deskripsi |
|------------|-----------|-----------|
| detail | string | Isi jurnal |
| judul | string | Judul jurnal |
| date_time | timestamp | Waktu pembuatan |
| email | string | Email pengguna |
| created_time | timestamp | Waktu dibuat |
| slider_value | number | Nilai slider mood |
| patientId | string | ID pasien |
| jurnalId | string | ID jurnal |

## Hubungan Antar Koleksi

### 1. Users - Sessions
- **Tipe**: One-to-many (satu-ke-banyak)
- **Deskripsi**: Satu user bisa memiliki banyak sesi, baik sebagai pasien maupun dokter
- **Relasi**: `users.uid` → `sessions.patientId` atau `sessions.doctorId`

### 2. Users - Kessler
- **Tipe**: One-to-many (satu-ke-banyak)
- **Deskripsi**: Satu user bisa memiliki banyak hasil tes Kessler
- **Relasi**: `users.uid` → `kessler.patientId`

### 3. Users - Jurnal
- **Tipe**: One-to-many (satu-ke-banyak)
- **Deskripsi**: Satu user bisa memiliki banyak jurnal
- **Relasi**: `users.uid` → `jurnal.patientId`
