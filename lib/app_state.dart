import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> _value) {
    _cart = _value;
  }

  void addToCart(DocumentReference _value) {
    _cart.add(_value);
  }

  void removeFromCart(DocumentReference _value) {
    _cart.remove(_value);
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
  }

  void updateCartAtIndex(
    int _index,
    Function(DocumentReference) updateFn,
  ) {
    updateFn(_cart[_index]);
  }

  double _cartSum = 0.0;
  double get cartSum => _cartSum;
  set cartSum(double _value) {
    _cartSum = _value;
  }

  int _numOfTickets = 0;
  int get numOfTickets => _numOfTickets;
  set numOfTickets(int _value) {
    _numOfTickets = _value;
  }

  List<DocumentReference> _docRef = [];
  List<DocumentReference> get docRef => _docRef;
  set docRef(List<DocumentReference> _value) {
    _docRef = _value;
  }

  void addToDocRef(DocumentReference _value) {
    _docRef.add(_value);
  }

  void removeFromDocRef(DocumentReference _value) {
    _docRef.remove(_value);
  }

  void removeAtIndexFromDocRef(int _index) {
    _docRef.removeAt(_index);
  }

  void updateDocRefAtIndex(
    int _index,
    Function(DocumentReference) updateFn,
  ) {
    updateFn(_docRef[_index]);
  }

  List<dynamic> _JSONs = [jsonDecode('{\"ticketName\":\"Ord\",\"ticketP\":5}')];
  List<dynamic> get JSONs => _JSONs;
  set JSONs(List<dynamic> _value) {
    _JSONs = _value;
  }

  void addToJSONs(dynamic _value) {
    _JSONs.add(_value);
  }

  void removeFromJSONs(dynamic _value) {
    _JSONs.remove(_value);
  }

  void removeAtIndexFromJSONs(int _index) {
    _JSONs.removeAt(_index);
  }

  void updateJSONsAtIndex(
    int _index,
    Function(dynamic) updateFn,
  ) {
    updateFn(_JSONs[_index]);
  }

  List<double> _orderAmounts = [];
  List<double> get orderAmounts => _orderAmounts;
  set orderAmounts(List<double> _value) {
    _orderAmounts = _value;
  }

  void addToOrderAmounts(double _value) {
    _orderAmounts.add(_value);
  }

  void removeFromOrderAmounts(double _value) {
    _orderAmounts.remove(_value);
  }

  void removeAtIndexFromOrderAmounts(int _index) {
    _orderAmounts.removeAt(_index);
  }

  void updateOrderAmountsAtIndex(
    int _index,
    Function(double) updateFn,
  ) {
    updateFn(_orderAmounts[_index]);
  }

  final _eventDManager = FutureRequestManager<EventsRecord>();
  Future<EventsRecord> eventD({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<EventsRecord> Function() requestFn,
  }) =>
      _eventDManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventDCache() => _eventDManager.clear();
  void clearEventDCacheKey(String? uniqueKey) =>
      _eventDManager.clearRequest(uniqueKey);

  final _eventsManager = StreamRequestManager<List<EventsRecord>>();
  Stream<List<EventsRecord>> events({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventsRecord>> Function() requestFn,
  }) =>
      _eventsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventsCache() => _eventsManager.clear();
  void clearEventsCacheKey(String? uniqueKey) =>
      _eventsManager.clearRequest(uniqueKey);

  final _userMomentsManager = FutureRequestManager<List<MomentsRecord>>();
  Future<List<MomentsRecord>> userMoments({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MomentsRecord>> Function() requestFn,
  }) =>
      _userMomentsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserMomentsCache() => _userMomentsManager.clear();
  void clearUserMomentsCacheKey(String? uniqueKey) =>
      _userMomentsManager.clearRequest(uniqueKey);

  final _userManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> user({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserCache() => _userManager.clear();
  void clearUserCacheKey(String? uniqueKey) =>
      _userManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
