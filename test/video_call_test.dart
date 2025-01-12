import 'package:flutter_test/flutter_test.dart';
import 'package:healing_up/backend/schema/video_call_record.dart';
import 'package:agora_uikit/agora_uikit.dart';

void main() {
  // Grup pengujian untuk panggilan video
  group('Video Call Tests', () {
    final testDate = DateTime(2025, 1, 8);
    
    // Menguji pembuatan panggilan video dengan data yang valid
    test('Create video call with valid data', () {
      final videoCallData = createVideoCallRecordData(
        bookingId: 'booking123',
        doctorId: 'doctor123',
        patientId: 'patient123',
        startTime: testDate,
        status: 'scheduled',
        channelName: 'test_channel',
        token: 'test_token'
      );

      // Memverifikasi setiap field memiliki nilai yang benar
      expect(videoCallData['bookingId'], equals('booking123'));
      expect(videoCallData['doctorId'], equals('doctor123'));
      expect(videoCallData['patientId'], equals('patient123'));
      expect(videoCallData['startTime'], equals(testDate));
      expect(videoCallData['status'], equals('scheduled'));
      expect(videoCallData['channelName'], equals('test_channel'));
      expect(videoCallData['token'], equals('test_token'));
    });

    // Menguji validasi status panggilan video
    test('Video call status should be valid', () {
      final validStatuses = ['scheduled', 'ongoing', 'completed', 'cancelled'];
      
      // Menguji setiap status yang valid
      for (final status in validStatuses) {
        final videoCallData = createVideoCallRecordData(
          bookingId: 'booking123',
          status: status
        );
        expect(videoCallData['status'], equals(status));
      }
    });

    // Menguji keunikan nama channel
    test('Channel name should be unique', () async {
      final timestamp1 = DateTime.now().millisecondsSinceEpoch;
      final firstCall = createVideoCallRecordData(
        channelName: 'channel_$timestamp1',
        bookingId: 'booking1'
      );
      
      // Delay agar timestamp berbeda
      await Future.delayed(const Duration(milliseconds: 1));
      
      final timestamp2 = DateTime.now().millisecondsSinceEpoch;
      final secondCall = createVideoCallRecordData(
        channelName: 'channel_$timestamp2',
        bookingId: 'booking2'
      );

      // Memastikan nama channel berbeda
      expect(firstCall['channelName'], isNot(equals(secondCall['channelName'])));
    });

    // Menguji field yang wajib diisi
    test('Video call should have required fields', () {
      final videoCallData = createVideoCallRecordData(
        bookingId: 'booking123',
        doctorId: 'doctor123',
        patientId: 'patient123'
      );

      // Memverifikasi field wajib tidak null
      expect(videoCallData['bookingId'], isNotNull);
      expect(videoCallData['doctorId'], isNotNull);
      expect(videoCallData['patientId'], isNotNull);
    });

    // Menguji perhitungan durasi panggilan
    test('Video call duration tracking', () {
      final startTime = DateTime.now();
      final videoCallData = createVideoCallRecordData(
        startTime: startTime,
        bookingId: 'booking123'
      );

      // Mensimulasikan durasi panggilan 30 menit
      final endTime = startTime.add(const Duration(minutes: 30));
      final duration = endTime.difference(videoCallData['startTime'] as DateTime);

      // Memverifikasi durasi
      expect(duration.inMinutes, equals(30));
    });

    // Menguji inisialisasi data koneksi Agora
    test('Agora connection data initialization', () {
      final connectionData = AgoraConnectionData(
        appId: "test_app_id",
        channelName: "test_channel",
      );

      // Memverifikasi data koneksi Agora
      expect(connectionData.appId, equals("test_app_id"));
      expect(connectionData.channelName, equals("test_channel"));
    });
  });
}
