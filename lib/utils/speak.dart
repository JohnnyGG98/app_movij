
import 'package:flutter_tts/flutter_tts.dart';

void speakNow(String text) async {
  // Para leer el texto  
  final FlutterTts _ftts = FlutterTts();
  await _ftts.setLanguage('es-US');
  await _ftts.setPitch(0.65);
  await _ftts.speak(text); 
}