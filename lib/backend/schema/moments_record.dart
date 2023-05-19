import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MomentsRecord extends FirestoreRecord {
  MomentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_posting" field.
  DocumentReference? _userPosting;
  DocumentReference? get userPosting => _userPosting;
  bool hasUserPosting() => _userPosting != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "post_media" field.
  String? _postMedia;
  String get postMedia => _postMedia ?? '';
  bool hasPostMedia() => _postMedia != null;

  // "post_time" field.
  DateTime? _postTime;
  DateTime? get postTime => _postTime;
  bool hasPostTime() => _postTime != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "isComment" field.
  String? _isComment;
  String get isComment => _isComment ?? '';
  bool hasIsComment() => _isComment != null;

  void _initializeFields() {
    _userPosting = snapshotData['user_posting'] as DocumentReference?;
    _caption = snapshotData['caption'] as String?;
    _postMedia = snapshotData['post_media'] as String?;
    _postTime = snapshotData['post_time'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _isComment = snapshotData['isComment'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moments');

  static Stream<MomentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MomentsRecord.fromSnapshot(s));

  static Future<MomentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MomentsRecord.fromSnapshot(s));

  static MomentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MomentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MomentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MomentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MomentsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMomentsRecordData({
  DocumentReference? userPosting,
  String? caption,
  String? postMedia,
  DateTime? postTime,
  String? isComment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_posting': userPosting,
      'caption': caption,
      'post_media': postMedia,
      'post_time': postTime,
      'isComment': isComment,
    }.withoutNulls,
  );

  return firestoreData;
}
