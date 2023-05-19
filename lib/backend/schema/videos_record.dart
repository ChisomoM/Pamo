import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "videos" field.
  String? _videos;
  String get videos => _videos ?? '';
  bool hasVideos() => _videos != null;

  // "vids" field.
  List<String>? _vids;
  List<String> get vids => _vids ?? const [];
  bool hasVids() => _vids != null;

  // "vi" field.
  String? _vi;
  String get vi => _vi ?? '';
  bool hasVi() => _vi != null;

  void _initializeFields() {
    _videos = snapshotData['videos'] as String?;
    _vids = getDataList(snapshotData['vids']);
    _vi = snapshotData['vi'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createVideosRecordData({
  String? videos,
  String? vi,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'videos': videos,
      'vi': vi,
    }.withoutNulls,
  );

  return firestoreData;
}
