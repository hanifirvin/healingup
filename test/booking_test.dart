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
        status: 'confirmed'
      );

      expect(bookingData['date'], equals(testDate));
      expect(bookingData['time'], equals('10:00'));
      expect(bookingData['doctorId'], equals('doctor123'));
      expect(bookingData['patientId'], equals('patient123'));
      expect(bookingData['status'], equals('confirmed'));
    });

    test('Create booking with minimum required fields', () {
      final bookingData = createBookingRecordData(
        doctorId: 'doctor123',
        patientId: 'patient123'
      );

      expect(bookingData['doctorId'], equals('doctor123'));
      expect(bookingData['patientId'], equals('patient123'));
      expect(bookingData['date'], isNull);
      expect(bookingData['time'], isNull);
      expect(bookingData['status'], isNull);
    });

    test('Booking status should be valid', () {
      final validStatuses = ['confirmed', 'completed',];
      
      for (final status in validStatuses) {
        final bookingData = createBookingRecordData(
          doctorId: 'doctor123',
          patientId: 'patient123',
          status: status
        );
        expect(bookingData['status'], equals(status));
      }
    });
  });
}
