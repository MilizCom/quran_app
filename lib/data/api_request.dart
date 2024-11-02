import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slicing_uiquran/data/model/surat_model.dart';

Future<List<Surat>> getSuratData() async {
  final response = await http.get(
    Uri.parse('https://equran.id/api/v2/surat'),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data['data'].map<Surat>((surat) => Surat.fromJson(surat)).toList();
  } else {
    debugPrint('Failed to load data');
  }

  return [];
}
