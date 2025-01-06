import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class Logger {
  log(String message, String? name) {
    if (kDebugMode) {
      print({name ?? 'anonymouse': message});
    }
    developer.log(message, name: name ?? 'anonymouse');
  }
}
