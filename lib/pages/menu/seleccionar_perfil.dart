import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/helpers/Helpers.dart';
import 'package:app_movij/models/user_model.dart';
import 'package:app_movij/pages/menu/juegos/menu_juego.dart';
import 'package:app_movij/templates/widgets/responsive.dart';
import 'package:app_movij/utils/global.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:app_movij/widgets/menu/menu_lateral.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class SeleccionarPerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Global().actualRoute = 'seleccionarPerfil';

    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Perfil'),
      ),
      body: Container(
        child: _getPerfiles(context),
      ),
      drawer: MenuLateral(),
    );
  }

  _getPerfiles(BuildContext context) {
    List<UserModel> list = Helpers.getRandomList(defaultUsers);
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        crossAxisSpacing: 40,
        mainAxisSpacing: 30,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int i) {
        return _PerfilButton(user: list[i]);
      },
    );
  }
}

class _PerfilButton extends StatelessWidget {
  final UserModel user;

  const _PerfilButton({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = _sizeImage(context);

    return GestureDetector(
      onTap: () {
        Flame.audio.play('play.wav', volume: 0.15);
        Navigator.push(context, DefaultFadeTransition(child: MenuJuegoPage()));
        Global().user = user;
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppThemeColors.WHITE, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppThemeColors.WHITE_SHADOW,
                    spreadRadius: 2.5,
                    blurRadius: 2,
                    offset: Offset(-0.5, 1.5),
                  )
                ],
                image: DecorationImage(
                  image: user.isNetworkImage
                      ? NetworkImage(user.image)
                      : AssetImage(user.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 7.5),
            Text(
              user.username,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppThemeColors.BLACK,
              ),
            ),
            // Divider(),
          ],
        ),
      ),
    );
  }

  double _sizeImage(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return 100;
    } else if (Responsive.isTablet(context)) {
      return 150;
    } else {
      return 175;
    }
  }
}
