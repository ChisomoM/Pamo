// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:barcode_widget/barcode_widget.dart';

Future<void> printTicketPDF(
  String name,
  String ticketID,
  String eventDate,
  String eventName,
  String collectionName,
  DocumentReference eventRef,
  DocumentReference userRef,
) async {
  final pdf = pw.Document();
  String username = name;
  String ticket = ticketID;
  String eventD = eventDate;
  String eventN = eventName;
  String collectionN = collectionName;
  DocumentReference eventR = eventRef;
  DocumentReference userR = userRef;

  for (var i = 1; i <= FFAppState().numOfTickets; i++) {
    String tID = await generateBoughtEventTicketID(
        10, false, false, '!', ticket, username);
    createTicketDocument(tID, collectionN);

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a6,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      '$eventN',
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Ticket Type',
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                  ]),
              pw.SizedBox(height: 20),
              pw.Container(
                child: pw.BarcodeWidget(
                  data: tID,
                  barcode: Barcode.code128(),
                  width: 200,
                  height: 40,
                  color: PdfColors.black,
                ),
              ), // Add the BarcodeWidget to the PDF
              pw.SizedBox(height: 20),
              pw.Text(
                'Date: $eventD',
                style: pw.TextStyle(fontSize: 10),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Booked by: $username',
                style: pw.TextStyle(fontSize: 10),
              ),
            ],
          );
        }));
  }

  await Printing.layoutPdf(onLayout: (format) => pdf.save());
}
