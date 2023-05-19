import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNotificationsRecord extends FirestoreRecord {
  UserNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "moment_ref" field.
  DocumentReference? _momentRef;
  DocumentReference? get momentRef => _momentRef;
  bool hasMomentRef() => _momentRef != null;

  // "sender_ref" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _momentRef = snapshotData['moment_ref'] as DocumentReference?;
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _notificationType = snapshotData['notification_type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_notifications')
          : FirebaseFirestore.instance.collectionGroup('user_notifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_notifications').doc();

  static Stream<UserNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNotificationsRecord.fromSnapshot(s));

  static Future<UserNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserNotificationsRecord.fromSnapshot(s));

  static UserNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUserNotificationsRecordData({
  DocumentReference? eventRef,
  DateTime? time,
  DocumentReference? userRef,
  DocumentReference? momentRef,
  DocumentReference? senderRef,
  String? notificationType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_ref': eventRef,
      'time': time,
      'user_ref': userRef,
      'moment_ref': momentRef,
      'sender_ref': senderRef,
      'notification_type': notificationType,
    }.withoutNulls,
  );

  return firestoreData;
}
