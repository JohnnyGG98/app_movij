import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';

Widget _getTituloJuego(String titulo) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0),
    child: Text(titulo + '  ',
      style: TextStyle(
        color: ACCENT_COLOR,
        fontSize: 35.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget getListaJuegos(BuildContext context, String titulo, Function lista) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[

        _getTituloJuego(titulo),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0))
            ),
            height: MediaQuery.of(context).size.height,
            child: Padding(padding: EdgeInsets.only(top: 35.0),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                children: lista(context),
              ) 
            ),
          ),
        )
      ],
    )
  );
}