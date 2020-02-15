import 'package:app_movij/C/colors.dart';
import 'package:flutter/material.dart';

class InformacionJuego extends StatefulWidget {
  final String texto;
  InformacionJuego(this.texto);

  @override
  _InformacionJuegoState createState() => _InformacionJuegoState();
}

class _InformacionJuegoState extends State<InformacionJuego> {

  bool _infoActivo = false; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PADDING_VERTICAL,
      child: ListTile(
        title: Text(widget.texto,
          style: TextStyle(
            fontSize: 20.0
          ),
          textAlign: TextAlign.justify,
        ),
        trailing: FloatingActionButton(
          onPressed: (){
            setState(() {
              _infoActivo = !_infoActivo;
            });
          }, 
          child: Icon( _infoActivo ? Icons.volume_up: Icons.volume_mute),
        ),
      ),
    );
  }
}