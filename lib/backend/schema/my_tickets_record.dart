import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyTicketsRecord extends FirestoreRecord {
  MyTicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticket_name" field.
  String? _ticketName;
  String get ticketName => _ticketName ?? '';
  bool hasTicketName() => _ticketName != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "ticket_ref" field.
  DocumentReference? _ticketRef;
  DocumentReference? get ticketRef => _ticketRef;
  bool hasTicketRef() => _ticketRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ticketName = snapshotData['ticket_name'] as String?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _ticketRef = snapshotData['ticket_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_tickets')
          : FirebaseFirestore.instance.collectionGroup('my_tickets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('my_tickets').doc();

  static Stream<MyTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyTicketsRecord.fromSnapshot(s));

  static Future<MyTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyTicketsRecord.fromSnapshot(s));

  static MyTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyTicketsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMyTicketsRecordData({
  String? ticketName,
  DocumentReference? eventRef,
  DocumentReference? ticketRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket_name': ticketName,
      'event_ref': eventRef,
      'ticket_ref': ticketRef,
    }.withoutNulls,
  );

  return firestoreData;
}
