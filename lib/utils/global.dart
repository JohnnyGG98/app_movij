import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/models/user_model.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Global {
  static final Global _singleton = Global._internal();
  // Constructor por defecto
  Global._internal();
  // Global instance por TTS
  // Para leer el texto
  final FlutterTts ftts = FlutterTts();

  String actualRoute = '/';
  UserModel user;

  factory Global() {
    return _singleton;
  }

  int _seed = AppCons.randGlobal.nextInt(5);

  int get randomInt {
    return AppCons.randGlobal.nextInt(++_seed);
  }

  bool get isLoged {
    return user != null;
  }

  void initTextToSpeak() {
    ftts.setLanguage('es-US');
    ftts.setPitch(0.6);
  }
}
