import 'package:app_movij/C/cons.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class VictoriaJuego extends StatefulWidget {

  final String msg;

  VictoriaJuego(this.msg);

  @override
  _VictoriaJuegoState createState() => _VictoriaJuegoState();
}

class _VictoriaJuegoState extends State<VictoriaJuego> with WidgetsBindingObserver {
  
  AudioPlayer _audioPlayer;  
  
  @override
  void initState() { 
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initAudio();
  }

  void _initAudio() async {
    _audioPlayer = await Flame.audio.loop('nyan-cat.mp3', volume: 0.15);
  }

  @override
  Widget build(BuildContext context) {
    return _baileVictoria(context, widget.msg); 
  }

  @override
  void dispose() { 
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _audioPlayer.resume();
        break;
      case AppLifecycleState.paused:
        _audioPlayer.pause();
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
  

}

Widget _baileVictoria(BuildContext context, String mensaje) {
  return Container(
    color: Colors.white,
    child: Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 330,
            width: 330,
            child: Image.asset('assets/images/gatito-kawaii.gif'),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.20,
          left: MediaQuery.of(context).size.width * 0.10,
          right: MediaQuery.of(context).size.width * 0.10,
          child: Text('Ganaste\n\n¡Felicidades!\n\n$mensaje', 
            style: TextStyle(
              fontSize: 20.0, 
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
              fontFamily: FONT_FAMILY_CONSOLA,
            ),

            textAlign: TextAlign.center,
          )
        )
      ],
    )
  );
}