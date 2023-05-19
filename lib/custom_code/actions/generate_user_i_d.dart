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

Future<String> generateUserID(int numOfChars, bool? onlyNumbers,
    bool? onlyLetters, String? specialChars, String username) async {
  int number = 6;
  onlyNumbers = onlyNumbers ?? false;
  onlyLetters = onlyLetters ?? false;
  specialChars = specialChars ?? '';
  String usernameID = username;

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

  return username.substring(0, 4) +
      String.fromCharCodes(Iterable.generate(
          number, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}
