import 'package:app_movij/templates/fondo.dart';
import 'package:app_movij/utils/pantalla.dart';
import 'package:app_movij/widgets/home/home_copy.dart';
import 'package:app_movij/widgets/home/home_play_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with PortraitModeMixin {
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
              Positioned(
                top: size.height * 0.675,
                left: size.width * 0.25,
                right: size.width * 0.25,
                child: HomeCopy(),
              ),
              Center(child: HomePlayButton()),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          child: Icon(
            Icons.vpn_key,
            size: 40,
          ),
          onPressed: () {},
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
}
