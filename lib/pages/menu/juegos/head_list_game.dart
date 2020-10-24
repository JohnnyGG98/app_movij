import 'package:flutter/material.dart';

class HeadListGame extends StatelessWidget {
  final String tipoJuego;
  final IconData icon;

  const HeadListGame({
    Key key,
    @required this.tipoJuego,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getHead(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF34495E),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            'by: Zero Team',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getHead() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 7.5,
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFECEBEB), width: 2.5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: _getActionsHead(),
    );
  }

  Widget _getActionsHead() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getText('Creditos'),
        Container(
          padding: EdgeInsets.all(7.5),
          decoration: BoxDecoration(
            color: Color(0xFF46B04A),
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38.withOpacity(0.3),
                spreadRadius: 1.5,
                blurRadius: 5,
                offset: Offset(1, 2),
              )
            ],
          ),
          child: Icon(
            this.icon,
            color: Colors.white,
            size: 45,
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
        ),
        _getText(this.tipoJuego),
      ],
    );
  }

  Text _getText(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Color(0xFF323639),
        letterSpacing: 1.1,
      ),
    );
  }
}
