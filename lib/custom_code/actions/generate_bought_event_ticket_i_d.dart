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
/*This is a function to generate an ID for a ticket that has been bought . This ID is a mixture of 2 characters from
the user creating the event, 2 characters from the event name and 6 randomly generated characters
*/

Future<String> generateBoughtEventTicketID(
    int numOfChars,
    bool? onlyNumbers,
    bool? onlyLetters,
    String? specialChars,
    String ticketID,
    String userName) async {
  int number = 4;
  onlyNumbers = onlyNumbers ?? false;
  onlyLetters = onlyLetters ?? false;
  specialChars = specialChars ?? '';
  String userNameID = userName;
  String ticket = ticketID;

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

  return ticket.substring(0, 6) +
      userNameID.substring(0, 4) +
      String.fromCharCodes(Iterable.generate(
          number, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}
