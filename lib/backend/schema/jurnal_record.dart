import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JurnalRecord extends FirestoreRecord {
  JurnalRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "judul" field.
  String? _judul;
  String get judul => _judul ?? '';
  bool hasJudul() => _judul != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "slider_value" field.
  double? _sliderValue;
  double get sliderValue => _sliderValue ?? 0.0;
  bool hasSliderValue() => _sliderValue != null;

  // "patientId" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  bool hasPatientId() => _patientId != null;

  // "jurnalId" field.
  String? _jurnalId;
  String get jurnalId => _jurnalId ?? '';
  bool hasJurnalId() => _jurnalId != null;

  void _initializeFields() {
    _detail = snapshotData['detail'] as String?;
    _judul = snapshotData['judul'] as String?;
    _dateTime = snapshotData['date_time'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _sliderValue = castToType<double>(snapshotData['slider_value']);
    _patientId = snapshotData['patientId'] as String?;
    _jurnalId = snapshotData['jurnalId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jurnal');

  static Stream<JurnalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JurnalRecord.fromSnapshot(s));

  static Future<JurnalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JurnalRecord.fromSnapshot(s));

  static JurnalRecord fromSnapshot(DocumentSnapshot snapshot) => JurnalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JurnalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JurnalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JurnalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JurnalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJurnalRecordData({
  String? detail,
  String? judul,
  DateTime? dateTime,
  String? email,
  DateTime? createdTime,
  double? sliderValue,
  String? patientId,
  String? jurnalId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'detail': detail,
      'judul': judul,
      'date_time': dateTime,
      'email': email,
      'created_time': createdTime,
      'slider_value': sliderValue,
      'patientId': patientId,
      'jurnalId': jurnalId,
    }.withoutNulls,
  );

  return firestoreData;
}

class JurnalRecordDocumentEquality implements Equality<JurnalRecord> {
  const JurnalRecordDocumentEquality();

  @override
  bool equals(JurnalRecord? e1, JurnalRecord? e2) {
    return e1?.detail == e2?.detail &&
        e1?.judul == e2?.judul &&
        e1?.dateTime == e2?.dateTime &&
        e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.sliderValue == e2?.sliderValue &&
        e1?.patientId == e2?.patientId &&
        e1?.jurnalId == e2?.jurnalId;
  }

  @override
  int hash(JurnalRecord? e) => const ListEquality().hash([
        e?.detail,
        e?.judul,
        e?.dateTime,
        e?.email,
        e?.createdTime,
        e?.sliderValue,
        e?.patientId,
        e?.jurnalId
      ]);

  @override
  bool isValidKey(Object? o) => o is JurnalRecord;
}
