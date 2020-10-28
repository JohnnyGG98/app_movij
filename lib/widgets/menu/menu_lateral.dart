import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/models/button_menu_model.dart';
import 'package:app_movij/models/user_model.dart';
import 'package:app_movij/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:app_movij/widgets/menu/menu_export.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoged = Global().isLoged;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: _getBody(isLoged),
          ),
          isLoged ? _getSalirButton(context) : _getLoginButton(),
        ],
      ),
    );
  }

  Widget _getBody(bool isLoged) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: isLoged ? _getUser(Global().user) : Container(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ...buttonsMenu
                    .map((button) => MenuOption(model: button))
                    .toList(),
                SizedBox(height: 10),
                MenuCredits(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getUser(UserModel user) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppThemeColors.BLUE,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              color: AppThemeColors.BLUE,
              size: 30,
            ),
          ),
          Text(
            user.username.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSalirButton(BuildContext context) {
    return MenuBottomButton(
      primary: AppThemeColors.BLUE,
      shadow: AppThemeColors.RED,
      label: 'Salir',
      onTap: () {
        print('Salimos');
        // Eliminar el usuario logueado
        Global().user = null;
        Navigator.of(context).pushReplacementNamed('/');
      },
    );
  }

  Widget _getLoginButton() {
    return MenuBottomButton(
      primary: AppThemeColors.BLUE,
      shadow: AppThemeColors.GREEN,
      label: 'Login',
      onTap: () {},
    );
  }
}
