import 'package:app_movij/config/config_export.dart';
import 'package:flutter/material.dart';

class MenuJuegoMobile extends StatelessWidget {
  final String titulo;
  final Function lista;

  const MenuJuegoMobile({
    Key key,
    @required this.titulo,
    @required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _getTituloJuego(titulo),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppThemeColors.BLUE,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100.0),
                ),
              ),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.only(top: 35.0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  children: lista(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTituloJuego(String titulo) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        titulo + '  ',
        style: TextStyle(
          color: AppThemeColors.GREEN,
          fontSize: 35.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
