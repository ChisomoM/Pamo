import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double getPrice(double? price) {
  if (price == null) {
    return 0;
  }

  double newPrice = price * 100;

  return newPrice.toDouble();
}

String? generateBoughtEventTicketID1(
  int? number,
  bool? onlyNumbers,
  bool? onlyLetters,
  String? specialChars,
  String? ticketID,
  String? userName,
) {
  int number = 4;
  onlyNumbers = onlyNumbers ?? false;
  onlyLetters = onlyLetters ?? false;
  specialChars = specialChars ?? '';
  userName = userName;
  ticketID = ticketID;

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

  return ticketID!.substring(0, 6) +
      userName!.substring(0, 4) +
      String.fromCharCodes(Iterable.generate(
          number, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

double? totalPrice(List<double>? prices) {
  // return the sum of doubles in a list
  if (prices == null) {
    return null;
  }
  return prices.reduce((value, element) => value + element);
}

double totalP(
  double price,
  int quantity,
) {
  return quantity * price;
}

double total(
  double subTotal,
  double price,
) {
  return subTotal + price;
}
