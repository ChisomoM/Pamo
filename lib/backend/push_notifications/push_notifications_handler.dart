import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Artboard_1.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'Explore': ParameterData.none(),
  'Moments': ParameterData.none(),
  'CreateProfile': (data) async => ParameterData(
        allParams: {
          'accountType': getParameter<DocumentReference>(data, 'accountType'),
        },
      ),
  'login': ParameterData.none(),
  'createMoment': ParameterData.none(),
  'AiCaption': ParameterData.none(),
  'SignUp': ParameterData.none(),
  'OtherBizUserProfile': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
          'userN': getParameter<String>(data, 'userN'),
        },
      ),
  'eventDetails': (data) async => ParameterData(
        allParams: {
          'eventDetails': getParameter<DocumentReference>(data, 'eventDetails'),
        },
      ),
  'Category': (data) async => ParameterData(
        allParams: {
          'categ': getParameter<String>(data, 'categ'),
        },
      ),
  'Saved': ParameterData.none(),
  'profile': ParameterData.none(),
  'UserSearch': ParameterData.none(),
  'ExploreM': ParameterData.none(),
  'searcho': ParameterData.none(),
  'EventSearch': ParameterData.none(),
  'MyProfile': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
        },
      ),
  'accountsettings': ParameterData.none(),
  'UnderConstruction': ParameterData.none(),
  'momentDetails': (data) async => ParameterData(
        allParams: {
          'momentRef': getParameter<DocumentReference>(data, 'momentRef'),
          'commentNum': getParameter<int>(data, 'commentNum'),
        },
      ),
  'venueDetails': (data) async => ParameterData(
        allParams: {
          'venueRef': getParameter<DocumentReference>(data, 'venueRef'),
        },
      ),
  'VenueSearch': ParameterData.none(),
  'test': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<CommentsRecord>(
              data, 'event', CommentsRecord.fromSnapshot),
        },
      ),
  'AccountDetails': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'ListNotifications': ParameterData.none(),
  'Checkout4': ParameterData.none(),
  'myTicket': (data) async => ParameterData(
        allParams: {
          'ticket': getParameter<DocumentReference>(data, 'ticket'),
        },
      ),
  'onBoarding': ParameterData.none(),
  'Search': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
