import 'package:app_movij/utils/global.dart';
import 'package:app_movij/widgets/game/text_animation_game.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class DanceWinGame extends StatefulWidget {
  final String username = Global().user.username;
  final double size = 200;

  @override
  _DanceWinGameState createState() => _DanceWinGameState();
}

class _DanceWinGameState extends State<DanceWinGame>
    with WidgetsBindingObserver {
  AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextAnimationGame(
            text: 'Victoria\n¡Felicidades!\n${widget.username.toUpperCase()}',
            minFontSize: 20,
            maxFontSize: 25,
            textStyle: TextStyle(
              fontSize: 25,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: widget.size,
            width: widget.size,
            child: Image.asset('assets/images/gatito-kawaii.gif'),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initAudio();
  }

  void _initAudio() async {
    _audioPlayer = await Flame.audio.loop('nyan-cat.mp3', volume: 0.10);
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
