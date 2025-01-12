import 'package:flutter_test/flutter_test.dart';
import 'package:healing_up/backend/schema/kessler_record.dart';

void main() {
  // Grup pengujian untuk tes Kessler
  group('Kessler Test Record Tests', () {
    // Menguji pembuatan data tes Kessler dengan skor valid
    test('Create Kessler record with valid score', () {
      final testDate = DateTime(2025, 1, 8);
      
      final kesslerData = createKesslerRecordData(
        hasilKessler: 25,
        waktuRiwayat: testDate,
        patientId: 'patient123'
      );

      // Memverifikasi setiap field memiliki nilai yang benar
      expect(kesslerData['hasil_kessler'], equals(25));
      expect(kesslerData['waktu_riwayat'], equals(testDate));
      expect(kesslerData['patientId'], equals('patient123'));
    });

    // Menguji skor Kessler harus dalam rentang yang valid
    test('Kessler score should be within valid range', () {
      // Menguji skor minimum (0)
      final minScoreData = createKesslerRecordData(
        hasilKessler: 0,
        patientId: 'patient123'
      );
      expect(minScoreData['hasil_kessler'], equals(0));

      // Menguji skor maksimum (50)
      final maxScoreData = createKesslerRecordData(
        hasilKessler: 50,
        patientId: 'patient123'
      );
      expect(maxScoreData['hasil_kessler'], equals(50));
    });

    // Menguji pembuatan data tes Kessler dengan field yang diperlukan minimum
    test('Create Kessler record with minimum required fields', () {
      final kesslerData = createKesslerRecordData(
        patientId: 'patient123'
      );

      expect(kesslerData['patientId'], equals('patient123'));
      expect(kesslerData['hasil_kessler'], isNull);
      expect(kesslerData['waktu_riwayat'], isNull);
    });

    // Menguji data tes Kessler harus menyimpan timestamp dengan benar
    test('Kessler record should store timestamp correctly', () {
      final timestamp = DateTime(2025, 1, 8, 10, 0); // Waktu spesifik
      final kesslerData = createKesslerRecordData(
        hasilKessler: 30,
        waktuRiwayat: timestamp,
        patientId: 'patient123'
      );

      expect(kesslerData['waktu_riwayat'], equals(timestamp));
      expect(kesslerData['waktu_riwayat'].year, equals(2025));
      expect(kesslerData['waktu_riwayat'].month, equals(1));
      expect(kesslerData['waktu_riwayat'].day, equals(8));
      expect(kesslerData['waktu_riwayat'].hour, equals(10));
    });
  });
}
