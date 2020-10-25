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
        color: Color(0xFF34495E),
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
              color: Color(0xFF34495E),
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
      // primary: Color(0xFFCB4041),
      primary: Color(0xFF34495E),
      shadow: Color(0xFFE75454),
      label: 'Salir',
      onTap: () {},
    );
  }

  Widget _getLoginButton() {
    return MenuBottomButton(
      // primary: Color(0xFF00BE4C),
      primary: Color(0xFF34495E),
      shadow: Color(0xFF68CA87),
      label: 'Login',
      onTap: () {},
    );
  }
}
