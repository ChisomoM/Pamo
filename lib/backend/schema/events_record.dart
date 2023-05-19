import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_Org" field.
  DocumentReference? _eventOrg;
  DocumentReference? get eventOrg => _eventOrg;
  bool hasEventOrg() => _eventOrg != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_location" field.
  LatLng? _eventLocation;
  LatLng? get eventLocation => _eventLocation;
  bool hasEventLocation() => _eventLocation != null;

  // "event_details" field.
  String? _eventDetails;
  String get eventDetails => _eventDetails ?? '';
  bool hasEventDetails() => _eventDetails != null;

  // "event_start" field.
  DateTime? _eventStart;
  DateTime? get eventStart => _eventStart;
  bool hasEventStart() => _eventStart != null;

  // "event_end" field.
  DateTime? _eventEnd;
  DateTime? get eventEnd => _eventEnd;
  bool hasEventEnd() => _eventEnd != null;

  // "event_description" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "event_poster" field.
  String? _eventPoster;
  String get eventPoster => _eventPoster ?? '';
  bool hasEventPoster() => _eventPoster != null;

  // "saved_by" field.
  List<DocumentReference>? _savedBy;
  List<DocumentReference> get savedBy => _savedBy ?? const [];
  bool hasSavedBy() => _savedBy != null;

  // "eventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "performers" field.
  List<DocumentReference>? _performers;
  List<DocumentReference> get performers => _performers ?? const [];
  bool hasPerformers() => _performers != null;

  // "event_venue" field.
  DocumentReference? _eventVenue;
  DocumentReference? get eventVenue => _eventVenue;
  bool hasEventVenue() => _eventVenue != null;

  // "is_draft" field.
  bool? _isDraft;
  bool get isDraft => _isDraft ?? false;
  bool hasIsDraft() => _isDraft != null;

  // "requested_performers" field.
  List<DocumentReference>? _requestedPerformers;
  List<DocumentReference> get requestedPerformers =>
      _requestedPerformers ?? const [];
  bool hasRequestedPerformers() => _requestedPerformers != null;

  void _initializeFields() {
    _eventOrg = snapshotData['event_Org'] as DocumentReference?;
    _eventName = snapshotData['event_name'] as String?;
    _eventLocation = snapshotData['event_location'] as LatLng?;
    _eventDetails = snapshotData['event_details'] as String?;
    _eventStart = snapshotData['event_start'] as DateTime?;
    _eventEnd = snapshotData['event_end'] as DateTime?;
    _eventDescription = snapshotData['event_description'] as String?;
    _eventPoster = snapshotData['event_poster'] as String?;
    _savedBy = getDataList(snapshotData['saved_by']);
    _eventID = snapshotData['eventID'] as String?;
    _category = snapshotData['category'] as String?;
    _performers = getDataList(snapshotData['performers']);
    _eventVenue = snapshotData['event_venue'] as DocumentReference?;
    _isDraft = snapshotData['is_draft'] as bool?;
    _requestedPerformers = getDataList(snapshotData['requested_performers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  static EventsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EventsRecord.getDocumentFromData(
        {
          'event_Org': safeGet(
            () => toRef(snapshot.data['event_Org']),
          ),
          'event_name': snapshot.data['event_name'],
          'event_location': safeGet(
            () => LatLng(
              snapshot.data['_geoloc']['lat'],
              snapshot.data['_geoloc']['lng'],
            ),
          ),
          'event_details': snapshot.data['event_details'],
          'event_start': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['event_start']),
          ),
          'event_end': safeGet(
            () =>
                DateTime.fromMillisecondsSinceEpoch(snapshot.data['event_end']),
          ),
          'event_description': snapshot.data['event_description'],
          'event_poster': snapshot.data['event_poster'],
          'saved_by': safeGet(
            () => snapshot.data['saved_by'].map((s) => toRef(s)).toList(),
          ),
          'eventID': snapshot.data['eventID'],
          'category': snapshot.data['category'],
          'performers': safeGet(
            () => snapshot.data['performers'].map((s) => toRef(s)).toList(),
          ),
          'event_venue': safeGet(
            () => toRef(snapshot.data['event_venue']),
          ),
          'is_draft': snapshot.data['is_draft'],
          'requested_performers': safeGet(
            () => snapshot.data['requested_performers']
                .map((s) => toRef(s))
                .toList(),
          ),
        },
        EventsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EventsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'events',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createEventsRecordData({
  DocumentReference? eventOrg,
  String? eventName,
  LatLng? eventLocation,
  String? eventDetails,
  DateTime? eventStart,
  DateTime? eventEnd,
  String? eventDescription,
  String? eventPoster,
  String? eventID,
  String? category,
  DocumentReference? eventVenue,
  bool? isDraft,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_Org': eventOrg,
      'event_name': eventName,
      'event_location': eventLocation,
      'event_details': eventDetails,
      'event_start': eventStart,
      'event_end': eventEnd,
      'event_description': eventDescription,
      'event_poster': eventPoster,
      'eventID': eventID,
      'category': category,
      'event_venue': eventVenue,
      'is_draft': isDraft,
    }.withoutNulls,
  );

  return firestoreData;
}
