# Dokumentasi Class Diagram Healing Up

Diagram Kelas (Class Diagram) adalah representasi visual dari struktur kelas dalam sistem. Diagram ini menunjukkan kelas-kelas dalam sistem dan hubungan antara mereka.

## 1. Kelas Dasar (Base Classes)

### FirestoreRecord
Kelas dasar untuk semua model yang terhubung dengan Firestore.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| reference | DocumentReference | Referensi dokumen di Firestore |
| data | Map<String, dynamic> | Data mentah dari Firestore |
| getDocument() | Method | Method abstrak untuk mengambil dokumen |
| getDocumentOnce() | Method | Method abstrak untuk mengambil dokumen sekali |
| fromSnapshot() | Method | Method abstrak untuk konversi snapshot ke objek |

### StatefulWidget
Kelas dasar Flutter untuk widget dengan state.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| createState() | Method | Method untuk membuat state widget |

### State
Kelas dasar untuk mengelola state widget.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| initState() | Method | Inisialisasi state |
| dispose() | Method | Pembersihan resource saat widget dihapus |
| setState() | Method | Memperbarui state widget |
| build() | Method | Membangun tampilan widget |

## 2. Kelas Model (Model Classes)

### UsersRecord
Model untuk data pengguna.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| email | String | Email pengguna |
| displayName | String | Nama yang ditampilkan |
| photoUrl | String | URL foto profil |
| uid | String | ID unik pengguna |
| createdTime | DateTime | Waktu pembuatan akun |
| phoneNumber | String | Nomor telepon |
| kessler | int | Skor tes Kessler |
| shortDescription | String | Deskripsi singkat |
| role | String | Peran (pasien/dokter) |
| title | String | Gelar profesional |
| resultKessler | String | Hasil interpretasi Kessler |
| resultTime | DateTime | Waktu tes Kessler |
| waktuPengukuran | List<DateTime> | Riwayat waktu tes |
| spesialisasi | String | Spesialisasi dokter |
| pengalaman | int | Tahun pengalaman |
| availableHours | List<String> | Jam praktik |
| isDoctorAvailable | bool | Status ketersediaan |
| deskripsiDokter | String | Deskripsi profil dokter |

### SessionsRecord
Model untuk sesi konsultasi.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| sessionId | String | ID unik sesi |
| startTime | DateTime | Waktu mulai |
| endTime | DateTime | Waktu selesai |
| status | String | Status sesi |
| notes | String | Catatan sesi |
| createdAt | DateTime | Waktu pembuatan |
| bookingId | String | ID booking |
| patientId | String | ID pasien |
| doctorId | String | ID dokter |
| doctorName | String | Nama dokter |
| reviewRating | double | Rating ulasan |
| reviewNotes | String | Catatan ulasan |

### BookingRecord
Model untuk pemesanan konsultasi.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| date | DateTime | Tanggal konsultasi |
| time | String | Waktu konsultasi |
| notes | String | Catatan pemesanan |
| status | String | Status pemesanan |
| videoCallUrl | String | URL video call |
| createdAt | DateTime | Waktu pembuatan |
| updatedAt | DateTime | Waktu update |
| doctorName | String | Nama dokter |
| patientId | String | ID pasien |
| doctorId | String | ID dokter |
| bookingId | String | ID booking |
| patientName | String | Nama pasien |

### KesslerRecord
Model untuk hasil tes Kessler.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| hasilKessler | int | Skor hasil tes |
| waktuRiwayat | DateTime | Waktu pengerjaan |
| patientId | String | ID pasien |

### JurnalRecord
Model untuk catatan jurnal.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| detail | String | Isi jurnal |
| judul | String | Judul jurnal |
| dateTime | DateTime | Waktu penulisan |
| email | String | Email penulis |
| createdTime | DateTime | Waktu pembuatan |
| sliderValue | double | Nilai tingkat stres |
| patientId | String | ID pasien |
| jurnalId | String | ID jurnal |

### ReviewRecord
Model untuk ulasan konsultasi.
| Atribut/Method | Tipe | Deskripsi |
|----------------|------|-----------|
| reviewId | String | ID ulasan |
| sessionId | String | ID sesi |
| rating | double | Nilai rating |
| review | String | Isi ulasan |
| createdAt | DateTime | Waktu pembuatan |
| patientName | String | Nama pasien |

## 3. Hubungan Antar Kelas

1. Semua kelas model (UsersRecord, SessionsRecord, dll.) mewarisi dari FirestoreRecord
   - Mendapatkan fungsionalitas dasar untuk interaksi dengan Firestore
   - Mengimplementasikan method-method abstrak dari FirestoreRecord

2. Setiap kelas model memiliki:
   - Atribut yang sesuai dengan struktur data di Firestore
   - Method untuk validasi (_initializeFields)
   - Method untuk pengecekan keberadaan data (has...)

3. Hubungan data antar kelas:
   - UsersRecord terhubung ke SessionsRecord melalui patientId/doctorId
   - SessionsRecord terhubung ke BookingRecord melalui bookingId
   - KesslerRecord dan JurnalRecord terhubung ke UsersRecord melalui patientId
   - ReviewRecord terhubung ke SessionsRecord melalui sessionId
