import 'package:app_movij/config/app_theme_colors.dart';
import 'package:app_movij/utils/global.dart';
import 'package:flutter/material.dart';

class DescriptionGame extends StatefulWidget {
  final String text;
  final String label;

  const DescriptionGame({
    Key key,
    @required this.text,
    @required this.label,
  }) : super(key: key);

  @override
  _DescriptionGameState createState() => _DescriptionGameState();
}

class _DescriptionGameState extends State<DescriptionGame> {
  bool activo = false;

  @override
  void initState() {
    super.initState();
    Global().ftts.setCompletionHandler(toggle);
  }

  @override
  void dispose() {
    Global().ftts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -15,
          top: -15,
          child: Transform.rotate(
            angle: -0.75,
            child: Icon(
              activo ? Icons.volume_up : Icons.volume_mute,
              size: 150,
              color: AppThemeColors.BLUE,
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(15),
          color: AppThemeColors.WHITE_SHADOW.withOpacity(0.6),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(widget.text),
                  ],
                ),
              ),
              _getButton()
            ],
          ),
        ),
      ],
    );

  }

  Widget _getButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppThemeColors.BLUE,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.white,
        icon: Icon(
          activo ? Icons.volume_up : Icons.volume_mute,
          size: 30,
        ),
        onPressed: () {
          toggle();
          if (activo) {
            _speak();
          } else {
            _stop();
          }
        },
      ),
    );
  }

  void toggle() {
    setState(() {
      activo = !activo;
    });
  }

  _speak() async {
    Global().ftts.speak(widget.text);
  }

  _stop() {
    Global().ftts.stop();
  }
}
