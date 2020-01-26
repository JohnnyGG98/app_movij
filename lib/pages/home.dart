import 'package:app_movij/C/colors.dart';
import 'package:app_movij/templates/copy.dart';
import 'package:app_movij/templates/fondo.dart';
import 'package:app_movij/utils/pantalla.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget  with PortraitModeMixin {

  static const double SIZE_LOGO = 110;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomPaint(
        painter: HomePainter(),
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 110.0,
                left: size.width / 2 - SIZE_LOGO,
                child: _ipcaLogo(),
              ),

              Center(
                child: _playButton(context),
              ),

              Container(
                margin: EdgeInsets.only(top: size.height * 0.70),
                width: double.infinity,
                child: getCopy(Colors.white),
              )

            ],
          ),
        )
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          child: Icon(Icons.vpn_key, size: 40,),
          onPressed: (){},
        ),
      ),
    );
  }

  Widget _ipcaLogo() {
    return Container(
      height: SIZE_LOGO,
      child: Image(
        image: AssetImage('assets/app/ipca.png'),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _playButton(BuildContext context) {
    return FlatButton(
      color: ACCENT_COLOR,
      onPressed: (){
        Navigator.of(context).pushNamed('seleccionarPerfil');
      },
      child: Text('JUGAR', 
        style: TextStyle(
          fontSize: 45,
          color: Colors.white,
          letterSpacing: 4.0
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 13.0),
    );
  }

}