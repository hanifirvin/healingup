import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "kessler" field.
  int? _kessler;
  int get kessler => _kessler ?? 0;
  bool hasKessler() => _kessler != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "result_kessler" field.
  String? _resultKessler;
  String get resultKessler => _resultKessler ?? '';
  bool hasResultKessler() => _resultKessler != null;

  // "result_time" field.
  DateTime? _resultTime;
  DateTime? get resultTime => _resultTime;
  bool hasResultTime() => _resultTime != null;

  // "waktu_pengukuran" field.
  List<DateTime>? _waktuPengukuran;
  List<DateTime> get waktuPengukuran => _waktuPengukuran ?? const [];
  bool hasWaktuPengukuran() => _waktuPengukuran != null;

  // "spesialisasi" field.
  String? _spesialisasi;
  String get spesialisasi => _spesialisasi ?? '';
  bool hasSpesialisasi() => _spesialisasi != null;

  // "pengalaman" field.
  int? _pengalaman;
  int get pengalaman => _pengalaman ?? 0;
  bool hasPengalaman() => _pengalaman != null;

  // "availableHours" field.
  List<String>? _availableHours;
  List<String> get availableHours => _availableHours ?? const [];
  bool hasAvailableHours() => _availableHours != null;

  // "availableDay" field.
  List<String>? _availableDay;
  List<String> get availableDay => _availableDay ?? const [];
  bool hasAvailableDay() => _availableDay != null;

  // "isDoctorAvailable" field.
  bool? _isDoctorAvailable;
  bool get isDoctorAvailable => _isDoctorAvailable ?? false;
  bool hasIsDoctorAvailable() => _isDoctorAvailable != null;

  // "deskripsiDokter" field.
  String? _deskripsiDokter;
  String get deskripsiDokter => _deskripsiDokter ?? '';
  bool hasDeskripsiDokter() => _deskripsiDokter != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _kessler = castToType<int>(snapshotData['kessler']);
    _shortDescription = snapshotData['shortDescription'] as String?;
    _role = snapshotData['role'] as String?;
    _resultKessler = snapshotData['result_kessler'] as String?;
    _resultTime = snapshotData['result_time'] as DateTime?;
    _waktuPengukuran = getDataList(snapshotData['waktu_pengukuran']);
    _spesialisasi = snapshotData['spesialisasi'] as String?;
    _pengalaman = castToType<int>(snapshotData['pengalaman']);
    _availableHours = getDataList(snapshotData['availableHours']);
    _availableDay = getDataList(snapshotData['availableDay']);
    _isDoctorAvailable = snapshotData['isDoctorAvailable'] as bool?;
    _deskripsiDokter = snapshotData['deskripsiDokter'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? kessler,
  String? shortDescription,
  String? role,
  String? resultKessler,
  DateTime? resultTime,
  String? spesialisasi,
  int? pengalaman,
  bool? isDoctorAvailable,
  String? deskripsiDokter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'kessler': kessler,
      'shortDescription': shortDescription,
      'role': role,
      'result_kessler': resultKessler,
      'result_time': resultTime,
      'spesialisasi': spesialisasi,
      'pengalaman': pengalaman,
      'isDoctorAvailable': isDoctorAvailable,
      'deskripsiDokter': deskripsiDokter,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.kessler == e2?.kessler &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.role == e2?.role &&
        e1?.resultKessler == e2?.resultKessler &&
        e1?.resultTime == e2?.resultTime &&
        listEquality.equals(e1?.waktuPengukuran, e2?.waktuPengukuran) &&
        e1?.spesialisasi == e2?.spesialisasi &&
        e1?.pengalaman == e2?.pengalaman &&
        listEquality.equals(e1?.availableHours, e2?.availableHours) &&
        listEquality.equals(e1?.availableDay, e2?.availableDay) &&
        e1?.isDoctorAvailable == e2?.isDoctorAvailable &&
        e1?.deskripsiDokter == e2?.deskripsiDokter;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.kessler,
        e?.shortDescription,
        e?.role,
        e?.resultKessler,
        e?.resultTime,
        e?.waktuPengukuran,
        e?.spesialisasi,
        e?.pengalaman,
        e?.availableHours,
        e?.availableDay,
        e?.isDoctorAvailable,
        e?.deskripsiDokter
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
