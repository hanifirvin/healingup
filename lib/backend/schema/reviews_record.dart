import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "patientName" field.
  String? _patientName;
  String get patientName => _patientName ?? '';
  bool hasPatientName() => _patientName != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  bool hasDoctorId() => _doctorId != null;

  // "doctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "bookingId" field.
  String? _bookingId;
  String get bookingId => _bookingId ?? '';
  bool hasBookingId() => _bookingId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rating = castToType<int>(snapshotData['rating']);
    _review = snapshotData['review'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _patientName = snapshotData['patientName'] as String?;
    _doctorId = snapshotData['doctorId'] as String?;
    _doctorName = snapshotData['doctorName'] as String?;
    _bookingId = snapshotData['bookingId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reviews')
          : FirebaseFirestore.instance.collectionGroup('reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reviews').doc(id);

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  int? rating,
  String? review,
  DateTime? createdAt,
  String? patientName,
  String? doctorId,
  String? doctorName,
  String? bookingId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'review': review,
      'createdAt': createdAt,
      'patientName': patientName,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'bookingId': bookingId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.review == e2?.review &&
        e1?.createdAt == e2?.createdAt &&
        e1?.patientName == e2?.patientName &&
        e1?.doctorId == e2?.doctorId &&
        e1?.doctorName == e2?.doctorName &&
        e1?.bookingId == e2?.bookingId;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.rating,
        e?.review,
        e?.createdAt,
        e?.patientName,
        e?.doctorId,
        e?.doctorName,
        e?.bookingId
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
