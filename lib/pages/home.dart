import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/utils/pantalla.dart';
import 'package:app_movij/widgets/common/icon_logo.dart';
import 'package:app_movij/widgets/home/home_play_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with PortraitModeMixin {
  static const double SIZE_LOGO = 110;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          color: AppThemeColors.BLUE,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getText(),
                _ipcaLogo(),
                Spacer(),
                Center(child: HomePlayButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconLogon(),
          Text(
            'Movij'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          Text(
            'Aprende jugando',
            style: TextStyle(
              color: AppThemeColors.WHITE,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ipcaLogo() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 25),
        height: SIZE_LOGO,
        child: Image(
          image: AssetImage('assets/app/ipca.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

}
