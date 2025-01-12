import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "bookingId" field.
  String? _bookingId;
  String get bookingId => _bookingId ?? '';
  bool hasBookingId() => _bookingId != null;

  // "patientId" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  bool hasPatientId() => _patientId != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  bool hasDoctorId() => _doctorId != null;

  // "doctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "reviewRating" field.
  double? _reviewRating;
  double get reviewRating => _reviewRating ?? 0.0;
  bool hasReviewRating() => _reviewRating != null;

  // "reviewNotes" field.
  String? _reviewNotes;
  String get reviewNotes => _reviewNotes ?? '';
  bool hasReviewNotes() => _reviewNotes != null;

  void _initializeFields() {
    _sessionId = snapshotData['sessionId'] as String?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _notes = snapshotData['notes'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _bookingId = snapshotData['bookingId'] as String?;
    _patientId = snapshotData['patientId'] as String?;
    _doctorId = snapshotData['doctorId'] as String?;
    _doctorName = snapshotData['doctorName'] as String?;
    _reviewRating = castToType<double>(snapshotData['reviewRating']);
    _reviewNotes = snapshotData['reviewNotes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  String? sessionId,
  DateTime? startTime,
  DateTime? endTime,
  String? status,
  String? notes,
  DateTime? createdAt,
  String? bookingId,
  String? patientId,
  String? doctorId,
  String? doctorName,
  double? reviewRating,
  String? reviewNotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sessionId': sessionId,
      'startTime': startTime,
      'endTime': endTime,
      'status': status,
      'notes': notes,
      'createdAt': createdAt,
      'bookingId': bookingId,
      'patientId': patientId,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'reviewRating': reviewRating,
      'reviewNotes': reviewNotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionsRecordDocumentEquality implements Equality<SessionsRecord> {
  const SessionsRecordDocumentEquality();

  @override
  bool equals(SessionsRecord? e1, SessionsRecord? e2) {
    return e1?.sessionId == e2?.sessionId &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.status == e2?.status &&
        e1?.notes == e2?.notes &&
        e1?.createdAt == e2?.createdAt &&
        e1?.bookingId == e2?.bookingId &&
        e1?.patientId == e2?.patientId &&
        e1?.doctorId == e2?.doctorId &&
        e1?.doctorName == e2?.doctorName &&
        e1?.reviewRating == e2?.reviewRating &&
        e1?.reviewNotes == e2?.reviewNotes;
  }

  @override
  int hash(SessionsRecord? e) => const ListEquality().hash([
        e?.sessionId,
        e?.startTime,
        e?.endTime,
        e?.status,
        e?.notes,
        e?.createdAt,
        e?.bookingId,
        e?.patientId,
        e?.doctorId,
        e?.doctorName,
        e?.reviewRating,
        e?.reviewNotes
      ]);

  @override
  bool isValidKey(Object? o) => o is SessionsRecord;
}
