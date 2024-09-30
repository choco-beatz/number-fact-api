import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_api/model/trivia.dart';

Future<String> getResponse(String number) async {
  final res = await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  final body = jsonDecode(res.body) as Map<String, dynamic>;
  final trivia = Trivia.fromJson(body);
  print(trivia.fact);
  return trivia.fact;
}
