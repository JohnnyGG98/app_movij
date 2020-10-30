import 'package:flutter/material.dart';
import 'button_play.dart';
import 'personaje_preview.dart';

class ContainerGame extends StatelessWidget {
  final String label;
  final String image;
  final Function callback;
  final List<Widget> children;

  const ContainerGame({
    Key key,
    this.label = ' ',
    @required this.image,
    @required this.callback,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (image != '')
                Expanded(
                  child: PersonajePreview(image: image),
                ),
              if (image != '') ButtonPlay(onTap: callback),
            ],
          ),
        ),
        Material(
          elevation: 5,
          child: Container(
            height: 175,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
