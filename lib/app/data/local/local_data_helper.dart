import 'dart:convert';

import 'package:flutter/services.dart';

abstract class LocalDataHelper{

  static Future<T> readJson<T>(String fileName) async {
    final String response = await rootBundle.loadString('assets/raw/$fileName');
    final data = await json.decode(response);

    return data;
  }
}