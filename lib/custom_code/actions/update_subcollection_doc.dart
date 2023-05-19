// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateSubcollectionDoc(
  String parentDocumentId,
  String collectionName,
  String subcollectionName,
  String documentId,
  String bookedTicket,
) async {
  // Null check and set default values
  parentDocumentId ??= '';
  collectionName ??= '';
  subcollectionName ??= '';
  documentId ??= '';
  bookedTicket ??= '';

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the parent document
  final parentDocRef =
      firestore.collection(collectionName).doc(parentDocumentId);

  // Get a reference to the subcollection
  final subcollectionRef =
      parentDocRef.collection(subcollectionName).doc(documentId);

  // Update the document with the new booked ticket string
  await subcollectionRef.update({
    'ticketID': FieldValue.arrayUnion([bookedTicket])
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
