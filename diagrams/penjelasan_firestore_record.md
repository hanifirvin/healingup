# Penjelasan Detail FirestoreRecord

## Kelas Dasar FirestoreRecord

`FirestoreRecord` adalah kelas abstrak yang berfungsi sebagai fondasi untuk semua interaksi dengan database Firestore dalam aplikasi Healing Up. Kelas ini memiliki dua komponen utama:

1. **reference (DocumentReference)**
   - Merupakan referensi ke dokumen Firestore
   - Digunakan untuk mengidentifikasi lokasi spesifik dokumen dalam database
   - Memungkinkan operasi CRUD (Create, Read, Update, Delete) pada dokumen

2. **snapshotData (Map<String, dynamic>)**
   - Menyimpan data aktual dari dokumen Firestore
   - Berformat Map dengan key berupa String dan value bisa berupa berbagai tipe data
   - Memungkinkan penyimpanan data yang fleksibel

## Fungsi-Fungsi Utama

### 1. Fungsi Konversi Data

#### mapFromFirestore
- Mengkonversi data dari Firestore ke format yang bisa digunakan aplikasi
- Menangani berbagai tipe data khusus:
  - Timestamp → DateTime
  - GeoPoint → LatLng
  - Data bersarang (nested data)
  - List/Array
  - Timestamp dalam bentuk list

#### mapToFirestore
- Mengkonversi data aplikasi ke format yang bisa disimpan di Firestore
- Menangani konversi:
  - LatLng → GeoPoint
  - Color → CSS String
  - Data bersarang
  - List/Array

### 2. Fungsi Utilitas

#### getDocument
- Mengambil dokumen dari Firestore
- Mengembalikan instance dari kelas turunan FirestoreRecord
- Menggunakan reference untuk mengidentifikasi dokumen

#### getDocumentOnce
- Mirip dengan getDocument tapi hanya mengambil data sekali
- Tidak men-subscribe ke perubahan dokumen
- Berguna untuk data yang jarang berubah

#### fromSnapshot
- Mengkonversi DocumentSnapshot ke objek record yang sesuai
- Digunakan saat menerima data dari Firestore

## Kelas Turunan

Semua kelas record dalam aplikasi mewarisi dari FirestoreRecord:

1. **UsersRecord**
   - Mengelola data pengguna
   - Memiliki field seperti email, displayName, photoUrl, dll.

2. **SessionsRecord**
   - Menyimpan data sesi konseling
   - Mencatat waktu mulai/selesai, status, dan review

3. **BookingRecord**
   - Menangani pemesanan konseling
   - Menyimpan detail jadwal dan informasi video call

4. **KesslerRecord**
   - Mencatat hasil tes Kessler
   - Menyimpan skor dan waktu pengukuran

5. **JurnalRecord**
   - Mengelola entri jurnal pengguna
   - Menyimpan detail dan timestamp jurnal

6. **ReviewsRecord**
   - Menyimpan ulasan sesi konseling
   - Mencatat rating dan feedback

## Fitur Keamanan dan Validasi

1. **FirestoreUtilData**
   - Mengatur operasi update Firestore
   - Menentukan apakah field yang tidak diset harus dihapus
   - Mengontrol operasi create dan delete

2. **Validasi Data**
   - Setiap field memiliki fungsi has... untuk mengecek keberadaan nilai
   - Mencegah error saat mengakses data yang tidak ada
   - Memberikan nilai default yang aman

## Penggunaan dalam Aplikasi

1. **Inisialisasi**
   ```dart
   // Contoh inisialisasi record
   Record._( 
     super.reference,
     super.data,
   ) {
     _initializeFields();
   }
   ```

2. **Mengakses Data**
   ```dart
   // Contoh pengambilan data
   final data = await UsersRecord.getDocument(reference);
   ```

3. **Memperbarui Data**
   ```dart
   // Contoh update data
   reference.update(mapToFirestore({
     'field': newValue,
   }));
   ```

## Kesimpulan

FirestoreRecord adalah komponen fundamental yang memungkinkan aplikasi Healing Up berinteraksi dengan database Firestore secara aman dan efisien. Dengan abstraksi yang disediakan, pengembang dapat fokus pada logika bisnis tanpa perlu khawatir tentang detail teknis konversi data dan manajemen state.
