import 'package:app_movij/templates/widgets/responsive.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class VictoriaJuego extends StatefulWidget {
  final String msg;

  VictoriaJuego(this.msg);

  @override
  _VictoriaJuegoState createState() => _VictoriaJuegoState();
}

class _VictoriaJuegoState extends State<VictoriaJuego>
    with WidgetsBindingObserver {
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
    return _BaileVictoria(mensaje: widget.msg);
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

class _BaileVictoria extends StatelessWidget {
  final String mensaje;

  const _BaileVictoria({
    Key key,
    @required this.mensaje,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = _sizeGatito(context);
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: size,
              width: size,
              child: Image.asset('assets/images/gatito-kawaii.gif'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Text(
              'Ganaste\n\n¡Felicidades!\n\n$mensaje',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 3,
                fontWeight: FontWeight.w500,
                fontFamily: 'PressStart2P',
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  double _sizeGatito(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return 330;
    } else if (Responsive.isTablet(context)) {
      return 430;
    } else {
      return 530;
    }
  }
}
