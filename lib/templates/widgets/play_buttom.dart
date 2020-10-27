import 'package:app_movij/config/config_export.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final Function onPlay;

  const PlayButton({
    @required this.onPlay,
  });

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double scale;

  @override
  void initState() {
    super.initState();
    Flame.audio.load('play.wav');
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scale = 1 + _controller.value;
    return Transform.scale(
      scale: scale,
      child: FlatButton(
        color: AppThemeColors.GREEN,
        onPressed: () async {
          _controller.forward();
          await Flame.audio.play('play.wav', volume: 0.25);
          Future.delayed(const Duration(milliseconds: 500), () {
            _controller.reverse();
            widget.onPlay();
          });
        },
        child: Text(
          'JUGAR',
          style:
              TextStyle(fontSize: 45, color: Colors.white, letterSpacing: 4.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
    );
  }
}
