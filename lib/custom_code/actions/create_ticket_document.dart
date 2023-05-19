// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> createTicketDocument(
  // double ticketPrice,
  String ticketID,
  String collectionName,
) async {
  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the collection
  final collectionRef = firestore.collection(collectionName);

  // Create a new document with the three fields
  final doc = {
    // 'ticket_price': ticketPrice,
    'booked_ticketsID': ticketID,
    // 'description': ticketDescription,
  };

  // final docRef = collectionRef.doc(documentRef.id);
  // final docSnapshot = await docRef.get();

  // if (docSnapshot.exists) {
  //   // Update the existing document with the new data
  //   await docRef.update(doc);
  // } else {
  //   // Add a new document to the collection
  await collectionRef.add(doc);
  // }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
