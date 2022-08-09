import 'package:flutter/foundation.dart';

class Log{
  static const String TAG = "Kiti";

  static void d(dynamic d){
    if (kDebugMode) {
      print("$TAG Debug: $d");
    }
  }

  static void e(dynamic d){
    if (kDebugMode) {
      print("$TAG Error: $d");
    }
  }
}