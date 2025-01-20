import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KesslerRecord extends FirestoreRecord {
  KesslerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "hasil_kessler" field.
  int? _hasilKessler;
  int get hasilKessler => _hasilKessler ?? 0;
  bool hasHasilKessler() => _hasilKessler != null;

  // "waktu_riwayat" field.
  DateTime? _waktuRiwayat;
  DateTime? get waktuRiwayat => _waktuRiwayat;
  bool hasWaktuRiwayat() => _waktuRiwayat != null;

  // "patientId" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  bool hasPatientId() => _patientId != null;

  // "answers" field.
  List<int>? _answers;
  List<int> get answers => _answers ?? [];
  bool hasAnswers() => _answers != null;

  void _initializeFields() {
    _hasilKessler = castToType<int>(snapshotData['hasil_kessler']);
    _waktuRiwayat = snapshotData['waktu_riwayat'] as DateTime?;
    _patientId = snapshotData['patientId'] as String?;
    _answers = (snapshotData['answers'] as List?)?.map((e) => e as int).toList();
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kessler');

  static Stream<KesslerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KesslerRecord.fromSnapshot(s));

  static Future<KesslerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KesslerRecord.fromSnapshot(s));

  static KesslerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KesslerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KesslerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KesslerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KesslerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KesslerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKesslerRecordData({
  int? hasilKessler,
  DateTime? waktuRiwayat,
  String? patientId,
  List<int>? answers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hasil_kessler': hasilKessler,
      'waktu_riwayat': waktuRiwayat,
      'patientId': patientId,
      'answers': answers,
    },
  );

  return firestoreData;
}

class KesslerRecordDocumentEquality implements Equality<KesslerRecord> {
  const KesslerRecordDocumentEquality();

  @override
  bool equals(KesslerRecord? e1, KesslerRecord? e2) {
    return e1?.hasilKessler == e2?.hasilKessler &&
        e1?.waktuRiwayat == e2?.waktuRiwayat &&
        e1?.patientId == e2?.patientId &&
        e1?.answers == e2?.answers;
  }

  @override
  int hash(KesslerRecord? e) => const ListEquality()
      .hash([e?.hasilKessler, e?.waktuRiwayat, e?.patientId, e?.answers]);

  @override
  bool isValidKey(Object? o) => o is KesslerRecord;
}
