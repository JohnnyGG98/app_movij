import 'package:flutter/material.dart';

class BallAnimated extends StatefulWidget {
  @override
  _BallAnimatedState createState() => _BallAnimatedState();
}

class _BallAnimatedState extends State<BallAnimated> 
with TickerProviderStateMixin {

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this, duration: const Duration(seconds: 10)
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //return Ball(controller: animationController, end: 100,);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.redAccent,
          height: size.height,
        ),
        Ball(controller: animationController, end: size.height, pos: 15,),
        Ball(controller: animationController, end: size.height, pos: 38,),
        Ball(controller: animationController, end: size.height, pos: 146,),
        Ball(controller: animationController, end: size.height, pos: 243,),
      ],
    );
  }
}

class Ball extends AnimatedWidget {

  final double end;
  final double pos;
  static const double SIZE_BALL = 40;

  Ball({AnimationController controller, this.end, this.pos}) 
  : super(listenable: Tween<double>(begin: 0, end: end)
  .animate(controller));

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Positioned(
      bottom: animation.value,
      left: pos,
      child: Container(
        height: SIZE_BALL,
        width: SIZE_BALL,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(SIZE_BALL)
        ),
      ),
    );
  }
}