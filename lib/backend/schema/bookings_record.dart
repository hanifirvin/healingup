import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  bool hasDoctorId() => _doctorId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _time = snapshotData['time'] as DateTime?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _notes = snapshotData['notes'] as String?;
    _doctorId = snapshotData['doctorId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookings')
          : FirebaseFirestore.instance.collectionGroup('bookings');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookings').doc(id);

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DateTime? time,
  DocumentReference? uid,
  String? notes,
  String? doctorId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'uid': uid,
      'notes': notes,
      'doctorId': doctorId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.time == e2?.time &&
        e1?.uid == e2?.uid &&
        e1?.notes == e2?.notes &&
        e1?.doctorId == e2?.doctorId;
  }

  @override
  int hash(BookingsRecord? e) =>
      const ListEquality().hash([e?.time, e?.uid, e?.notes, e?.doctorId]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
