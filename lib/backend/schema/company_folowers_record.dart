import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CompanyFolowersRecord extends FirestoreRecord {
  CompanyFolowersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "start_at" field.
  DateTime? _startAt;
  DateTime? get startAt => _startAt;
  bool hasStartAt() => _startAt != null;

  void _initializeFields() {
    _company = snapshotData['company'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _startAt = snapshotData['start_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('company_folowers');

  static Stream<CompanyFolowersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyFolowersRecord.fromSnapshot(s));

  static Future<CompanyFolowersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyFolowersRecord.fromSnapshot(s));

  static CompanyFolowersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyFolowersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyFolowersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyFolowersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyFolowersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyFolowersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyFolowersRecordData({
  DocumentReference? company,
  DocumentReference? user,
  DateTime? startAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company': company,
      'user': user,
      'start_at': startAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyFolowersRecordDocumentEquality
    implements Equality<CompanyFolowersRecord> {
  const CompanyFolowersRecordDocumentEquality();

  @override
  bool equals(CompanyFolowersRecord? e1, CompanyFolowersRecord? e2) {
    return e1?.company == e2?.company &&
        e1?.user == e2?.user &&
        e1?.startAt == e2?.startAt;
  }

  @override
  int hash(CompanyFolowersRecord? e) =>
      const ListEquality().hash([e?.company, e?.user, e?.startAt]);

  @override
  bool isValidKey(Object? o) => o is CompanyFolowersRecord;
}
