import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingRecord extends FirestoreRecord {
  BookingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "videoCallUrl" field.
  String? _videoCallUrl;
  String get videoCallUrl => _videoCallUrl ?? '';
  bool hasVideoCallUrl() => _videoCallUrl != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "doctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "patientId" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  bool hasPatientId() => _patientId != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  bool hasDoctorId() => _doctorId != null;

  // "bookingId" field.
  String? _bookingId;
  String get bookingId => _bookingId ?? '';
  bool hasBookingId() => _bookingId != null;

  // "patientName" field.
  String? _patientName;
  String get patientName => _patientName ?? '';
  bool hasPatientName() => _patientName != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _time = snapshotData['time'] as String?;
    _notes = snapshotData['notes'] as String?;
    _status = snapshotData['status'] as String?;
    _videoCallUrl = snapshotData['videoCallUrl'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _doctorName = snapshotData['doctorName'] as String?;
    _patientId = snapshotData['patientId'] as String?;
    _doctorId = snapshotData['doctorId'] as String?;
    _bookingId = snapshotData['bookingId'] as String?;
    _patientName = snapshotData['patientName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking');

  static Stream<BookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingRecord.fromSnapshot(s));

  static Future<BookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingRecord.fromSnapshot(s));

  static BookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingRecordData({
  DateTime? date,
  String? time,
  String? notes,
  String? status,
  String? videoCallUrl,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? doctorName,
  String? patientId,
  String? doctorId,
  String? bookingId,
  String? patientName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'time': time,
      'notes': notes,
      'status': status,
      'videoCallUrl': videoCallUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'doctorName': doctorName,
      'patientId': patientId,
      'doctorId': doctorId,
      'bookingId': bookingId,
      'patientName': patientName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingRecordDocumentEquality implements Equality<BookingRecord> {
  const BookingRecordDocumentEquality();

  @override
  bool equals(BookingRecord? e1, BookingRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.notes == e2?.notes &&
        e1?.status == e2?.status &&
        e1?.videoCallUrl == e2?.videoCallUrl &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.doctorName == e2?.doctorName &&
        e1?.patientId == e2?.patientId &&
        e1?.doctorId == e2?.doctorId &&
        e1?.bookingId == e2?.bookingId &&
        e1?.patientName == e2?.patientName;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality().hash([
        e?.date,
        e?.time,
        e?.notes,
        e?.status,
        e?.videoCallUrl,
        e?.createdAt,
        e?.updatedAt,
        e?.doctorName,
        e?.patientId,
        e?.doctorId,
        e?.bookingId,
        e?.patientName
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
