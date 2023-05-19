// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Future<String> generateEventTicketID(
    int numOfChars,
    bool? onlyNumbers,
    bool? onlyLetters,
    String? specialChars,
    String eventName,
    String ticketName) async {
  int number = 4;
  onlyNumbers = onlyNumbers ?? false;
  onlyLetters = onlyLetters ?? false;
  specialChars = specialChars ?? '';
  String eventNameID = eventName;
  String ticketNameID = ticketName;

  var chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  if (onlyNumbers) {
    chars = '1234567890';
  } else if (onlyLetters) {
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  }

  if (specialChars.isNotEmpty) {
    chars = chars + specialChars;
  }

  var rnd = math.Random();

  return eventNameID.substring(0, 3) +
      ticketNameID.substring(0, 3) +
      String.fromCharCodes(Iterable.generate(
          number, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}
