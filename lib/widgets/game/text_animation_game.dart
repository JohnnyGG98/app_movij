import 'package:flutter/material.dart';

class TextAnimationGame extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final double maxFontSize;
  final double minFontSize;

  const TextAnimationGame({
    Key key,
    @required this.text,
    @required this.textStyle,
    @required this.maxFontSize,
    @required this.minFontSize,
  }) : super(key: key);

  @override
  _TextAnimationGameState createState() => _TextAnimationGameState();
}

class _TextAnimationGameState extends State<TextAnimationGame>
    with SingleTickerProviderStateMixin {
  int words = 1;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    if (widget.text.contains('\n')) {
      words = widget.text.split('\n').length + 1;
    }

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    animation = Tween<double>(
      begin: widget.minFontSize,
      end: widget.maxFontSize,
    ).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          height: widget.maxFontSize * words,
          child: Text(
            widget.text,
            style: widget.textStyle.copyWith(
              fontSize: animation.value,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
