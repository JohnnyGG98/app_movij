import 'package:flutter/material.dart';

class PersonaPreview extends StatefulWidget {
  final pathImage;
  final double height, width;
  final int tiempo; 

  PersonaPreview(this.pathImage, {
    this.height:175, 
    this.width:175,
    this.tiempo:400
  });

  @override
  _PersonaPreviewState createState() => _PersonaPreviewState();
}

class _PersonaPreviewState extends State<PersonaPreview> with TickerProviderStateMixin {

  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this, duration: Duration(seconds: widget.tiempo)
    );
    animationController.forward();
    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        setState(() {
          animationController.repeat();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget miPersonaje = Container(
      height: widget.height,
      width: widget.width,
      child: Image(
        image: AssetImage(widget.pathImage),
        fit: BoxFit.contain
      ),
    );

    return Personaje(
      controller: animationController, 
      widget: miPersonaje, 
      end: 360,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}


class Personaje extends AnimatedWidget {

  final double end;
  final Widget widget;

  Personaje({AnimationController controller, this.widget, this.end}) 
  : super(listenable: Tween<double>(begin: 0, end: end)
  .animate(controller));

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Transform.rotate(
      angle: animation.value,
      child: widget
    );
  }
}