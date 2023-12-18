import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TypesOfCompanyRecord extends FirestoreRecord {
  TypesOfCompanyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('types_of_company');

  static Stream<TypesOfCompanyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TypesOfCompanyRecord.fromSnapshot(s));

  static Future<TypesOfCompanyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TypesOfCompanyRecord.fromSnapshot(s));

  static TypesOfCompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TypesOfCompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TypesOfCompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TypesOfCompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TypesOfCompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TypesOfCompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTypesOfCompanyRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class TypesOfCompanyRecordDocumentEquality
    implements Equality<TypesOfCompanyRecord> {
  const TypesOfCompanyRecordDocumentEquality();

  @override
  bool equals(TypesOfCompanyRecord? e1, TypesOfCompanyRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(TypesOfCompanyRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is TypesOfCompanyRecord;
}
