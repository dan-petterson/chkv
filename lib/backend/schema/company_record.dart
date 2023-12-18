import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CompanyRecord extends FirestoreRecord {
  CompanyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "LocationCoordinate" field.
  LatLng? _locationCoordinate;
  LatLng? get locationCoordinate => _locationCoordinate;
  bool hasLocationCoordinate() => _locationCoordinate != null;

  // "LocationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "Type" field.
  DocumentReference? _type;
  DocumentReference? get type => _type;
  bool hasType() => _type != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "Logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _locationCoordinate = snapshotData['LocationCoordinate'] as LatLng?;
    _locationName = snapshotData['LocationName'] as String?;
    _type = snapshotData['Type'] as DocumentReference?;
    _owner = snapshotData['Owner'] as DocumentReference?;
    _logo = snapshotData['Logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('company');

  static Stream<CompanyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyRecord.fromSnapshot(s));

  static Future<CompanyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyRecord.fromSnapshot(s));

  static CompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyRecordData({
  String? name,
  LatLng? locationCoordinate,
  String? locationName,
  DocumentReference? type,
  DocumentReference? owner,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'LocationCoordinate': locationCoordinate,
      'LocationName': locationName,
      'Type': type,
      'Owner': owner,
      'Logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyRecordDocumentEquality implements Equality<CompanyRecord> {
  const CompanyRecordDocumentEquality();

  @override
  bool equals(CompanyRecord? e1, CompanyRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.locationCoordinate == e2?.locationCoordinate &&
        e1?.locationName == e2?.locationName &&
        e1?.type == e2?.type &&
        e1?.owner == e2?.owner &&
        e1?.logo == e2?.logo;
  }

  @override
  int hash(CompanyRecord? e) => const ListEquality().hash([
        e?.name,
        e?.locationCoordinate,
        e?.locationName,
        e?.type,
        e?.owner,
        e?.logo
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyRecord;
}
