import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "item_count" field.
  int? _itemCount;
  int get itemCount => _itemCount ?? 0;
  bool hasItemCount() => _itemCount != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "total_amount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "orders" field.
  List<DocumentReference>? _orders;
  List<DocumentReference> get orders => _orders ?? const [];
  bool hasOrders() => _orders != null;

  // "sub_total" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _itemCount = snapshotData['item_count'] as int?;
    _isActive = snapshotData['is_active'] as bool?;
    _totalAmount = castToType<double>(snapshotData['total_amount']);
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _orders = getDataList(snapshotData['orders']);
    _subTotal = castToType<double>(snapshotData['sub_total']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCartsRecordData({
  DocumentReference? userRef,
  int? itemCount,
  bool? isActive,
  double? totalAmount,
  DocumentReference? eventRef,
  double? subTotal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'item_count': itemCount,
      'is_active': isActive,
      'total_amount': totalAmount,
      'event_ref': eventRef,
      'sub_total': subTotal,
    }.withoutNulls,
  );

  return firestoreData;
}
