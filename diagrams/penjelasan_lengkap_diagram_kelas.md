# Penjelasan Lengkap Diagram Kelas Aplikasi Healing Up

## Struktur Dasar Aplikasi

Aplikasi Healing Up dibangun dengan struktur yang kompleks namun terorganisir dengan baik. Di jantung aplikasi ini terdapat kelas dasar `FirestoreRecord` yang berfungsi sebagai fondasi untuk semua interaksi dengan basis data Firebase. Kelas ini menyediakan fungsi-fungsi penting seperti `getDocument()` dan `fromSnapshot()` yang memungkinkan aplikasi untuk berkomunikasi dengan Firestore secara efisien.

## Manajemen Data Pengguna

Kelas `UsersRecord` merupakan komponen sentral dalam aplikasi yang mengelola semua informasi pengguna. Setiap pengguna memiliki data pribadi seperti email, nama, foto profil, dan nomor telepon. Khusus untuk dokter, terdapat informasi tambahan seperti spesialisasi, pengalaman, dan jadwal ketersediaan. Sistem ini mendukung dua jenis pengguna utama: pasien dan dokter, yang dibedakan melalui field `role`.

## Sistem Konseling dan Booking

Proses konseling dikelola melalui tiga kelas utama yang saling terhubung:

1. `BookingRecord` menangani proses pemesanan sesi konseling. Setiap booking mencatat detail seperti tanggal, waktu, catatan, dan URL video call. Satu booking hanya dapat dibuat oleh satu pasien untuk satu dokter (kardinalitas 1-ke-1).

2. `SessionsRecord` mencatat detail sesi konseling yang berlangsung. Setiap sesi terhubung dengan satu booking (kardinalitas 1-ke-1) dan dapat memiliki satu ulasan (kardinalitas 1-ke-1 dengan `ReviewsRecord`).

3. `ReviewsRecord` menyimpan ulasan dan rating dari pasien setelah sesi konseling. Setiap review terkait dengan satu sesi spesifik, memastikan transparansi dan akuntabilitas layanan.

## Fitur Monitoring Kesehatan Mental

Aplikasi menyediakan dua fitur utama untuk monitoring kesehatan mental:

1. `KesslerRecord` mengelola hasil pengukuran psikologis menggunakan skala Kessler. Satu pengguna dapat memiliki banyak hasil pengukuran (kardinalitas 1-ke-banyak), memungkinkan tracking kondisi mental dari waktu ke waktu.

2. `JurnalRecord` memungkinkan pengguna mencatat perasaan dan pikiran mereka. Setiap pengguna dapat membuat banyak entri jurnal (kardinalitas 1-ke-banyak), mendukung dokumentasi kesehatan mental yang berkelanjutan.

## Sistem Video Call

Implementasi video call menggunakan kelas `AgoraVideoCallWidget` yang terintegrasi dengan SDK Agora. Widget ini mengelola sesi video call secara real-time, termasuk manajemen izin kamera dan mikrofon. Setiap sesi konseling dapat memiliki satu sesi video call aktif.

## Hubungan Antar Kelas (Kardinalitas)

Sistem kardinalitas dalam aplikasi dirancang untuk memastikan integritas data dan hubungan yang logis:

- **Hubungan User-Sessions (1-ke-banyak)**: Seorang pengguna dapat memiliki banyak sesi konseling, baik sebagai pasien maupun dokter. Ini memungkinkan tracking riwayat konseling yang komprehensif.

- **Hubungan User-Bookings (1-ke-banyak)**: Seorang pengguna dapat membuat banyak booking, mendukung fleksibilitas dalam penjadwalan konseling.

- **Hubungan User-Kessler (1-ke-banyak)**: Setiap pengguna dapat memiliki multiple hasil tes Kessler, memungkinkan monitoring kesehatan mental jangka panjang.

- **Hubungan User-Jurnal (1-ke-banyak)**: Pengguna dapat membuat banyak entri jurnal, mendukung dokumentasi kesehatan mental yang berkelanjutan.

- **Hubungan Session-Review (1-ke-1)**: Setiap sesi konseling hanya dapat memiliki satu ulasan, menjamin kejelasan feedback.

- **Hubungan Booking-Session (1-ke-1)**: Setiap booking menghasilkan tepat satu sesi konseling, memastikan tracking yang akurat.

## Pewarisan dan Struktur Widget

Diagram juga menunjukkan struktur pewarisan yang jelas:

1. Semua record (UsersRecord, SessionsRecord, dll.) mewarisi dari FirestoreRecord, memastikan konsistensi dalam operasi database.

2. Widget-widget dalam aplikasi mengikuti pola Flutter dengan mewarisi StatefulWidget dan mengelola state melalui kelas State terpisah.

## Kesimpulan

Struktur kelas dalam aplikasi Healing Up mencerminkan pendekatan yang terorganisir dan scalable dalam pengembangan aplikasi kesehatan mental. Sistem kardinalitas yang diterapkan memastikan integritas data dan hubungan logis antar komponen, sementara pewarisan kelas memungkinkan penggunaan kembali kode yang efisien. Keseluruhan arsitektur mendukung pengalaman pengguna yang seamless sambil mempertahankan keamanan dan privasi data sensitif.
