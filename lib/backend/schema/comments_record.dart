import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "user_comment" field.
  DocumentReference? _userComment;
  DocumentReference? get userComment => _userComment;
  bool hasUserComment() => _userComment != null;

  // "post_time" field.
  DateTime? _postTime;
  DateTime? get postTime => _postTime;
  bool hasPostTime() => _postTime != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _userComment = snapshotData['user_comment'] as DocumentReference?;
    _postTime = snapshotData['post_time'] as DateTime?;
    _numComments = snapshotData['num_comments'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comments').doc();

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCommentsRecordData({
  String? comment,
  DocumentReference? userComment,
  DateTime? postTime,
  int? numComments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'user_comment': userComment,
      'post_time': postTime,
      'num_comments': numComments,
    }.withoutNulls,
  );

  return firestoreData;
}
