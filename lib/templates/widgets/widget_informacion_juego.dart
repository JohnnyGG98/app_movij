import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class InformacionJuego extends StatefulWidget {
  final String texto;
  InformacionJuego(this.texto);

  @override
  _InformacionJuegoState createState() => _InformacionJuegoState();
}

class _InformacionJuegoState extends State<InformacionJuego> {

  bool _infoActivo = false; 

  // Para leer el texto  
  final FlutterTts _ftts = FlutterTts(); 
  
  @override
  void initState() {
    super.initState();
    _ftts.setCompletionHandler((){
      setState(() {
        _infoActivo = !_infoActivo;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _ftts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PADDING_VERTICAL,
      child: ListTile(
        title: Text(widget.texto,
          style: TextStyle(
            fontSize: 20.0
          ),
          textAlign: TextAlign.justify,
        ),
        trailing: FloatingActionButton(
          onPressed: (){
            setState(() {
              _infoActivo = !_infoActivo;
            });
            if (_infoActivo) {
              _speak();
            } else {
              _stop();
            }
            
          }, 
          child: Icon( _infoActivo ? Icons.volume_up: Icons.volume_mute),
        ),
      ),
    );
  }


  _speak() async {
    // Configuracion 
    // es-US
    // es-ES
    // print(_ftts.getLanguages);
    // Voces
    // es-us-x-sfb-network
    // es-US-language
    // es-es-x-ana-network
    // es-us-x-sfb#female_2-local
    // print(await _ftts.getVoices);
    await _ftts.setLanguage('es-US');
    // LAG
    // await _ftts.setVoice('es-us-x-sfb-network');
    await _ftts.setPitch(0.7);

    await _ftts.speak(widget.texto);
  }

  _stop() async {
    await _ftts.stop();
  }



}