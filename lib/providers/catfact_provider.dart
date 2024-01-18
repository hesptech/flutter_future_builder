import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final catFactProvider = FutureProvider<String>((ref) async {
  final uri = Uri.parse('https://catfact.ninja/fact');
  final response = await http.get(uri);

  return jsonDecode(response.body)['fact'];
});