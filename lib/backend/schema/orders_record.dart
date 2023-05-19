import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "ticket_name" field.
  String? _ticketName;
  String get ticketName => _ticketName ?? '';
  bool hasTicketName() => _ticketName != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "cart_ref" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  // "ticket_ref" field.
  DocumentReference? _ticketRef;
  DocumentReference? get ticketRef => _ticketRef;
  bool hasTicketRef() => _ticketRef != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "ticket_id" field.
  String? _ticketId;
  String get ticketId => _ticketId ?? '';
  bool hasTicketId() => _ticketId != null;

  // "in_cart" field.
  bool? _inCart;
  bool get inCart => _inCart ?? false;
  bool hasInCart() => _inCart != null;

  // "has_paid" field.
  bool? _hasPaid;
  bool get hasPaid => _hasPaid ?? false;
  bool hasHasPaid() => _hasPaid != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _ticketName = snapshotData['ticket_name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = snapshotData['quantity'] as int?;
    _cartRef = snapshotData['cart_ref'] as DocumentReference?;
    _ticketRef = snapshotData['ticket_ref'] as DocumentReference?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _ticketId = snapshotData['ticket_id'] as String?;
    _inCart = snapshotData['in_cart'] as bool?;
    _hasPaid = snapshotData['has_paid'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createOrdersRecordData({
  String? eventName,
  String? ticketName,
  double? price,
  int? quantity,
  DocumentReference? cartRef,
  DocumentReference? ticketRef,
  DocumentReference? eventRef,
  String? ticketId,
  bool? inCart,
  bool? hasPaid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'ticket_name': ticketName,
      'price': price,
      'quantity': quantity,
      'cart_ref': cartRef,
      'ticket_ref': ticketRef,
      'event_ref': eventRef,
      'ticket_id': ticketId,
      'in_cart': inCart,
      'has_paid': hasPaid,
    }.withoutNulls,
  );

  return firestoreData;
}
