import 'package:app_movij/animated/balls.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animacion'),
      ),
        body: Container(
          color: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: BallAnimated(),
          height: MediaQuery.of(context).size.height,
        ),
    );
  }
}