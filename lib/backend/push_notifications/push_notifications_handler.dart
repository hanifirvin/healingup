import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'welcome': ParameterData.none(),
  'loginPage': ParameterData.none(),
  'registerPage': ParameterData.none(),
  'homePage': ParameterData.none(),
  'errorPage': ParameterData.none(),
  'pengukuran_page': ParameterData.none(),
  'quiz1': ParameterData.none(),
  'quiz2': ParameterData.none(),
  'quiz3': ParameterData.none(),
  'quiz4': ParameterData.none(),
  'quiz5': ParameterData.none(),
  'quiz6': ParameterData.none(),
  'quiz7': ParameterData.none(),
  'quiz8': ParameterData.none(),
  'quiz9': ParameterData.none(),
  'quiz10': ParameterData.none(),
  'hasil_pengukuran_page': ParameterData.none(),
  'profile_page': ParameterData.none(),
  'edit_profile': ParameterData.none(),
  'Syarat_Ketentuan_Page': ParameterData.none(),
  'jurnal_page': ParameterData.none(),
  'riwayat_page': ParameterData.none(),
  'tambah_jurnal_page': ParameterData.none(),
  'calling_pages': ParameterData.none(),
  'edit_jurnal_page': (data) async => ParameterData(
        allParams: {
          'judulJurnal': getParameter<String>(data, 'judulJurnal'),
          'detailJurnal': getParameter<String>(data, 'detailJurnal'),
          'sliderJurnal': getParameter<double>(data, 'sliderJurnal'),
          'createdJurnal': getParameter<DateTime>(data, 'createdJurnal'),
          'jurnalRef': getParameter<DocumentReference>(data, 'jurnalRef'),
        },
      ),
  'daftar_pasien': ParameterData.none(),
  'konseling_baru': ParameterData.none(),
  'after_booking_baru': (data) async => ParameterData(
        allParams: {
          'bookingId': getParameter<String>(data, 'bookingId'),
        },
      ),
  'riwayat_konseling': ParameterData.none(),
  'detail_sesi_booking': (data) async => ParameterData(
        allParams: {
          'bookingId': getParameter<String>(data, 'bookingId'),
        },
      ),
  'detail_riwayat_page': (data) async => ParameterData(
        allParams: {
          'sessionId': getParameter<String>(data, 'sessionId'),
        },
      ),
  'pilih_dokter_ajukan_jadwal': ParameterData.none(),
  'dokter_page_utama': ParameterData.none(),
  'tentukan_jadwal_konseling_baru': (data) async => ParameterData(
        allParams: {
          'doctorId': getParameter<String>(data, 'doctorId'),
          'doctorName': getParameter<String>(data, 'doctorName'),
        },
      ),
  'atur_jadwal_dokter_baru': ParameterData.none(),
  'edit_profile_dokter_baru': ParameterData.none(),
  'profile_pilih_dokter_dan_rating': (data) async => ParameterData(
        allParams: {
          'doctorId': getParameter<String>(data, 'doctorId'),
          'doctorName': getParameter<String>(data, 'doctorName'),
          'doctorExperience': getParameter<int>(data, 'doctorExperience'),
        },
      ),
  'detail_pasien_baru': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<String>(data, 'bookingID'),
          'patientId': getParameter<String>(data, 'patientId'),
        },
      ),
  'riwayat_jurnal_pasien': (data) async => ParameterData(
        allParams: {
          'patientID': getParameter<String>(data, 'patientID'),
        },
      ),
  'dashboard_coba_tabbar': ParameterData.none(),
  'breathe': ParameterData.none(),
  'info_breath_equal': ParameterData.none(),
  'home_dashboard_baru': ParameterData.none(),
  'riwayat_kessler_pasien': (data) async => ParameterData(
        allParams: {
          'patientID': getParameter<String>(data, 'patientID'),
        },
      ),
  'isi_jurnal_pasien': (data) async => ParameterData(
        allParams: {
          'jurnalID': getParameter<DocumentReference>(data, 'jurnalID'),
        },
      ),
  'home_dashboard_baruCopy': ParameterData.none(),
  'home_dashboard_baruCopy2': ParameterData.none(),
  'detail_sesi_dokter': (data) async => ParameterData(
        allParams: {
          'bookingId': getParameter<String>(data, 'bookingId'),
        },
      ),
  'begin_breath_exercise': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
