import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerifiedOrdersRecord extends FirestoreRecord {
  VerifiedOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "verified" field.
  List<DocumentReference>? _verified;
  List<DocumentReference> get verified => _verified ?? const [];
  bool hasVerified() => _verified != null;

  void _initializeFields() {
    _verified = getDataList(snapshotData['verified']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verified_orders');

  static Stream<VerifiedOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VerifiedOrdersRecord.fromSnapshot(s));

  static Future<VerifiedOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VerifiedOrdersRecord.fromSnapshot(s));

  static VerifiedOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerifiedOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerifiedOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerifiedOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerifiedOrdersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createVerifiedOrdersRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}
