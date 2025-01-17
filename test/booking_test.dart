import 'package:flutter_test/flutter_test.dart';
import 'package:healing_up/backend/schema/booking_record.dart';

void main() {
  group('Booking Tests', () {
    final testDate = DateTime(2025, 1, 8);
    
    test('Create booking with valid data', () {
      final bookingData = createBookingRecordData(
        date: testDate,
        time: '10:00',
        doctorId: 'doctor123',
        patientId: 'patient123',
        status: 'terjadwal',
        notes: 'Konsultasi pertama',
      );

      expect(bookingData['date'], equals(testDate));
      expect(bookingData['time'], equals('10:00'));
      expect(bookingData['doctorId'], equals('doctor123'));
      expect(bookingData['patientId'], equals('patient123'));
      expect(bookingData['status'], equals('terjadwal'));
      expect(bookingData['notes'], equals('Konsultasi pertama'));
    });

    test('Create booking with required fields', () {
      final bookingData = createBookingRecordData(
        date: testDate,
        time: '14:00',
        doctorId: 'doctor123',
        patientId: 'patient123',
        status: 'terjadwal',
        notes: 'test',
      );

      expect(bookingData['date'], equals(testDate));
      expect(bookingData['time'], equals('14:00'));
      expect(bookingData['doctorId'], equals('doctor123'));
      expect(bookingData['patientId'], equals('patient123'));
      expect(bookingData['status'], equals('terjadwal'));
      expect(bookingData['notes'], equals('test'));
    });

    test('Booking status should be valid', () {
      final validStatuses = ['terjadwal', 'selesai',];
      
      for (final status in validStatuses) {
        final bookingData = createBookingRecordData(
          date: testDate,
          time: '15:00',
          doctorId: 'doctor123',
          patientId: 'patient123',
          status: status,
          notes: 'test',
        );
        expect(bookingData['status'], equals(status));
        expect(bookingData['notes'], equals('test'));
      }
    });
  });
}
