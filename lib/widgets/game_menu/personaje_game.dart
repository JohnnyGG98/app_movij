import 'package:app_movij/config/config_export.dart';
import 'package:flutter/material.dart';

class PersonajeGame extends StatefulWidget {
  final String img;
  final Function onTap;

  const PersonajeGame({
    Key key,
    @required this.img,
    @required this.onTap,
  }) : super(key: key);

  @override
  _PersonajeGameState createState() => _PersonajeGameState();
}

class _PersonajeGameState extends State<PersonajeGame>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: controller);

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -0.15),
    ).animate(curve);
    // Agregando listener al animation de play
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: InkWell(
        onTap: () {
          controller.forward();
          widget.onTap();
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppThemeColors.WHITE_SHADOW.withOpacity(0.75),
                spreadRadius: 1.5,
                blurRadius: 3,
                offset: Offset(1, 2),
              )
            ],
          ),
          child: Column(
            children: [
              Spacer(),
              Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(10),
                child:
                    Image(image: AssetImage(widget.img), fit: BoxFit.contain),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Seleccionar',
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
