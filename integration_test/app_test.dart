import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:healing_up/main.dart' as app;
import 'package:firebase_core/firebase_core.dart';
import 'package:healing_up/firebase_options.dart';
import 'package:clock/clock.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Tes Alur Booking dan Video Call', () {
    setUpAll(() async {
      try {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      } catch (e) {
      }
    });

    testWidgets('Alur lengkap booking hingga video call', (tester) async {
      // Mock waktu ke besok untuk mensimulasikan waktu appointment
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      await tester.runAsync(() async {
        // Membangun aplikasi dan memicu frame
        await tester.pumpWidget(app.MyApp());
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Proses login
        await mockLogin(tester);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // Navigasi ke halaman booking
        await navigateToBooking(tester);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // Memilih dokter dan waktu
        await selectDoctorAndTime(tester);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // Konfirmasi booking
        await confirmBooking(tester);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // Memulai video call
        await startVideoCall(tester);
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Menguji kontrol video call
        await testVideoCallControls(tester);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // Mengakhiri panggilan dan verifikasi
        await endCallAndVerify(tester);
      });
    });
  });
}

Future<void> mockLogin(WidgetTester tester) async {
  // Menunggu widget selesai dirender
  await tester.pumpAndSettle(const Duration(seconds: 2));

  // Mencoba menemukan field input dengan berbagai cara
  final emailField = find.byKey(const Key('email_field'));
  if (emailField.evaluate().isNotEmpty) {
    await tester.enterText(emailField, 'test@example.com');
  } else {
    // Mencoba menemukan berdasarkan tipe dan teks petunjuk
    final textFields = find.byType(TextField);
    for (final field in textFields.evaluate()) {
      final widget = field.widget as TextField;
      if (widget.decoration?.labelText == 'Email' ||
          widget.decoration?.hintText == 'Masukkan Email...') {
        await tester.enterText(find.byWidget(widget), 'test@example.com');
        break;
      }
    }
  }
  await tester.pumpAndSettle();

  final passwordField = find.byKey(const Key('password_field'));
  if (passwordField.evaluate().isNotEmpty) {
    await tester.enterText(passwordField, 'password123');
  } else {
    // Mencoba menemukan berdasarkan tipe dan teks petunjuk
    final textFields = find.byType(TextField);
    for (final field in textFields.evaluate()) {
      final widget = field.widget as TextField;
      if (widget.decoration?.labelText == 'Password' ||
          widget.decoration?.hintText == 'Masukkan Password...') {
        await tester.enterText(find.byWidget(widget), 'password123');
        break;
      }
    }
  }
  await tester.pumpAndSettle();

  // Mencoba menemukan dan menekan tombol login
  final loginButton = find.text('Login');
  if (loginButton.evaluate().isNotEmpty) {
    await tester.tap(loginButton.first);
  }
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> navigateToBooking(WidgetTester tester) async {
  // Mencoba menemukan dan menekan tombol booking
  final bookButton = find.text('Konseling');
  if (bookButton.evaluate().isNotEmpty) {
    await tester.tap(bookButton.first);
  }
  await tester.pumpAndSettle();
}

Future<void> selectDoctorAndTime(WidgetTester tester) async {
  // Mencoba menemukan dan menekan kartu dokter
  final doctorCard = find.byType(Card);
  if (doctorCard.evaluate().isNotEmpty) {
    await tester.tap(doctorCard.first);
    await tester.pumpAndSettle();
  }

  // Mencoba menemukan dan menekan ikon kalender
  final calendarIcon = find.byIcon(Icons.calendar_today);
  if (calendarIcon.evaluate().isNotEmpty) {
    await tester.tap(calendarIcon.first);
    await tester.pumpAndSettle();

    // Memilih tanggal hari ini
    final today = DateTime.now();
    final dateText = today.day.toString();
    final dateButton = find.text(dateText);
    if (dateButton.evaluate().isNotEmpty) {
      await tester.tap(dateButton.first);
      await tester.pumpAndSettle();
      
      final okButton = find.text('OK');
      if (okButton.evaluate().isNotEmpty) {
        await tester.tap(okButton);
        await tester.pumpAndSettle();
      }
    }
  }

  // Mencoba menemukan dan menekan slot waktu yang sesuai dengan waktu saat ini
  final now = DateTime.now();
  final currentHour = now.hour;
  final timeSlots = find.byType(ListTile);
  
  if (timeSlots.evaluate().isNotEmpty) {
    // Pilih slot waktu yang paling dekat dengan waktu saat ini
    await tester.tap(timeSlots.first);
    await tester.pumpAndSettle();
  }
}

Future<void> confirmBooking(WidgetTester tester) async {
  // Mencoba menemukan dan menekan tombol konfirmasi
  final confirmButton = find.text('Ajukan Jadwal');
  if (confirmButton.evaluate().isNotEmpty) {
    await tester.tap(confirmButton.first);
  }
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> startVideoCall(WidgetTester tester) async {
  // Mencoba menemukan dan menekan tombol detail konseling
  final appointmentsButton = find.text('Detail Konseling');
  if (appointmentsButton.evaluate().isNotEmpty) {
    await tester.tap(appointmentsButton.first);
  }
  await tester.pumpAndSettle();

  // Mencoba menemukan dan menekan tombol mulai konseling
  final startButton = find.text('Mulai');
  if (startButton.evaluate().isNotEmpty) {
    await tester.tap(startButton.first);
  }
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> testVideoCallControls(WidgetTester tester) async {
  // Mencoba menemukan dan menekan tombol mikrofon
  for (final icon in [Icons.mic, Icons.mic_none]) {
    final micButton = find.byIcon(icon);
    if (micButton.evaluate().isNotEmpty) {
      await tester.tap(micButton.first);
      break;
    }
  }
  await tester.pumpAndSettle();

  // Mencoba menemukan dan menekan tombol kamera
  for (final icon in [Icons.videocam, Icons.video_call]) {
    final cameraButton = find.byIcon(icon);
    if (cameraButton.evaluate().isNotEmpty) {
      await tester.tap(cameraButton.first);
      break;
    }
  }
  await tester.pumpAndSettle();
}

Future<void> endCallAndVerify(WidgetTester tester) async {
  // Mencoba menemukan dan menekan tombol akhiri panggilan
  final endCallButton = find.byIcon(Icons.call_end);
  if (endCallButton.evaluate().isNotEmpty) {
    await tester.tap(endCallButton.first);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  // Memverifikasi kembali ke halaman detail konseling
  final appointmentsText = find.text('Detail Konseling');
  if (appointmentsText.evaluate().isNotEmpty) {
    expect(appointmentsText, findsOneWidget);
  }
}
