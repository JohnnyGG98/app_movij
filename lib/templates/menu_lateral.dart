import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/models/button_menu_model.dart';
import 'package:app_movij/templates/widgets/menu_bottom_button.dart';
import 'package:app_movij/templates/widgets/menu_credits.dart';
import 'package:app_movij/templates/widgets/menu_option.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Funcion para comprobar que el usuario este loguead
    final isLoged = false;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: _getBody(),
          ),
          isLoged ? _getSalirButton() : _getLoginButton(),
        ],
      ),
    );
  }

  Widget _getBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: _getUser(),
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

  Widget _getUser() {
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
            'Johnny Garcia'.toUpperCase(),
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

  Widget _getSalirButton() {
    return MenuBottomButton(
      primary: AppThemeColors.BLUE,
      shadow: AppThemeColors.RED,
      label: 'Salir',
      onTap: () {},
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
