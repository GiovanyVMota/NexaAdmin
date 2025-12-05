import 'package:flutter/foundation.dart';

class Api {
  // Detecta automaticamente o ambiente
  static String get baseUrl {
    if (kIsWeb) {
      return "http://localhost:3000";
    } else {
      // Emulador Android
      return "http://10.0.2.2:3000";
    }
  }
}
