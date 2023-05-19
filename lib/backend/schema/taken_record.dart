import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TakenRecord extends FirestoreRecord {
  TakenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taken_username" field.
  List<String>? _takenUsername;
  List<String> get takenUsername => _takenUsername ?? const [];
  bool hasTakenUsername() => _takenUsername != null;

  // "taken_UID" field.
  List<String>? _takenUID;
  List<String> get takenUID => _takenUID ?? const [];
  bool hasTakenUID() => _takenUID != null;

  // "taken_eventID" field.
  List<String>? _takenEventID;
  List<String> get takenEventID => _takenEventID ?? const [];
  bool hasTakenEventID() => _takenEventID != null;

  // "taken_ticketID" field.
  List<String>? _takenTicketID;
  List<String> get takenTicketID => _takenTicketID ?? const [];
  bool hasTakenTicketID() => _takenTicketID != null;

  void _initializeFields() {
    _takenUsername = getDataList(snapshotData['taken_username']);
    _takenUID = getDataList(snapshotData['taken_UID']);
    _takenEventID = getDataList(snapshotData['taken_eventID']);
    _takenTicketID = getDataList(snapshotData['taken_ticketID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('taken');

  static Stream<TakenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TakenRecord.fromSnapshot(s));

  static Future<TakenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TakenRecord.fromSnapshot(s));

  static TakenRecord fromSnapshot(DocumentSnapshot snapshot) => TakenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TakenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TakenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TakenRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTakenRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}
