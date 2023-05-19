import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticket_description" field.
  String? _ticketDescription;
  String get ticketDescription => _ticketDescription ?? '';
  bool hasTicketDescription() => _ticketDescription != null;

  // "ticket_name" field.
  String? _ticketName;
  String get ticketName => _ticketName ?? '';
  bool hasTicketName() => _ticketName != null;

  // "ticketID" field.
  String? _ticketID;
  String get ticketID => _ticketID ?? '';
  bool hasTicketID() => _ticketID != null;

  // "eventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "ticket_price" field.
  double? _ticketPrice;
  double get ticketPrice => _ticketPrice ?? 0.0;
  bool hasTicketPrice() => _ticketPrice != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ticketDescription = snapshotData['ticket_description'] as String?;
    _ticketName = snapshotData['ticket_name'] as String?;
    _ticketID = snapshotData['ticketID'] as String?;
    _eventID = snapshotData['eventID'] as String?;
    _ticketPrice = castToType<double>(snapshotData['ticket_price']);
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tickets')
          : FirebaseFirestore.instance.collectionGroup('tickets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tickets').doc();

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTicketsRecordData({
  String? ticketDescription,
  String? ticketName,
  String? ticketID,
  String? eventID,
  double? ticketPrice,
  DocumentReference? eventRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket_description': ticketDescription,
      'ticket_name': ticketName,
      'ticketID': ticketID,
      'eventID': eventID,
      'ticket_price': ticketPrice,
      'event_ref': eventRef,
    }.withoutNulls,
  );

  return firestoreData;
}
