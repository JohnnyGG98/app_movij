import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';


Widget getBtnJuego(String text) {
  return RaisedButton(
    shape: StadiumBorder(),
    color: PRIMARY_COLOR,
    onPressed: (){},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Text(text, 
        style: TextStyle(
          fontSize: 35,
          letterSpacing: 5,
          color: Colors.white
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}