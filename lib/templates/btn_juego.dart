import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';


Widget getBtnJuego(String text, Function navigate) {
  return RaisedButton(
    shape: StadiumBorder(),
    color: PRIMARY_COLOR,
    onPressed: (){navigate();},
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

Widget getBtnPersonaje(String img, Function navigate) {
  return OutlineButton(
    shape: StadiumBorder(),
    onPressed: navigate,
    borderSide: BorderSide(color: PRIMARY_COLOR, width: 3),
    child: Container(
      height: 125,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Image(
        image: AssetImage(img),
        fit: BoxFit.contain
      ),
    ),
  );
}