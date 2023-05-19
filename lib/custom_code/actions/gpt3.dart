// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<String> gpt3(
  String apiKey,
  String prompt,
  int maxTokens,
  double? temperature,
) async {
  final data = {
    'prompt': prompt,
    'max_tokens': maxTokens,
    'temperature': temperature,
  };

  final headers = {
    'Authorization':
        'Bearer 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',
    'Content-Type': 'application/json'
  };
  final request = http.Request(
    'POST',
    Uri.parse('https://api.openai.com/v1/engines/text-davinci-003/completions'),
  );
  request.body = json.encode(data);
  request.headers.addAll(headers);

  final httpResponse = await request.send();
  if (httpResponse.statusCode != 200) {
    return 'Failed to get response from the server, status code: ${httpResponse.statusCode}';
  }
  final jsonResponse = json.decode(await httpResponse.stream.bytesToString());
  if (jsonResponse == null) {
    return 'Failed to parse response from the server';
  }
  return jsonResponse['choices'][0]['text'];
}
