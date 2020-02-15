import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';

Widget getBtnJuego(String text, Function navigate) {
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50.0),
        bottomRight: Radius.circular(50.0)
      )
    ),
    color: ACCENT_COLOR,
    onPressed: (){navigate();},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
      child: Text(text, 
        style: TextStyle(
          fontSize: 30,
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
      height: 150,
      width: 200,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Image(
        image: AssetImage(img),
        fit: BoxFit.contain
      ),
    ),
  );
}

Widget getPlayButtom(Function action) {
  return FlatButton(
    color: ACCENT_COLOR,
    onPressed: action,
    child: Text('JUGAR', 
      style: TextStyle(
        fontSize: 45,
        color: Colors.white,
        letterSpacing: 4.0
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  );
}