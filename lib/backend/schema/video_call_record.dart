import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, dynamic> createVideoCallRecordData({
  String? bookingId,
  String? doctorId,
  String? patientId,
  DateTime? startTime,
  String? status,
  String? channelName,
  String? token,
}) {
  final firestoreData = {
    'bookingId': bookingId,
    'doctorId': doctorId,
    'patientId': patientId,
    'startTime': startTime,
    'status': status,
    'channelName': channelName,
    'token': token,
  };

  return firestoreData;
}
