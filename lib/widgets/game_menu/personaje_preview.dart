import 'package:flutter/material.dart';

class PersonajePreview extends StatefulWidget {
  final image;
  final double height;
  final double width;

  const PersonajePreview({
    Key key,
    @required this.image,
    this.height = 175,
    this.width = 175,
  }) : super(key: key);

  @override
  _PersonajePreviewState createState() => _PersonajePreviewState();
}

class _PersonajePreviewState extends State<PersonajePreview>
    with SingleTickerProviderStateMixin  {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);

    controller.repeat();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Image(
          image: AssetImage(this.widget.image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
