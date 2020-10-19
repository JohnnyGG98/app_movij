import 'package:flutter/material.dart';

// Colores que usaremos en las animaciones
final darkGrey = const Color(0xFF232323);
final bulbOnColor = const Color(0xFFFFE12C);
final bulbOffColor = const Color(0xFFC1C1C1);
final gradientStartColor = const Color(0xFFFDF380);
final gradientEndColor = const Color(0xFFFFFFED);
final animationDuration = const Duration(milliseconds: 500);

class LamparaPage extends StatefulWidget {
  @override
  _LamparaPageState createState() => _LamparaPageState();
}

class _LamparaPageState extends State<LamparaPage> {
  bool switched = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _LampCable(
              screenHeight: size.height,
              screenWidth: size.width,
              color: darkGrey,
            ),
            _Bulb(
              screenHeight: size.height,
              screenWidth: size.width,
              isSwitch: switched,
            ),
            _Lamp(
              screenHeight: size.height,
              screenWidth: size.width,
              color: darkGrey,
              isSwitch: switched,
            ),
            _LampSwith(
              screenHeight: size.height,
              screenWidth: size.width,
              color: darkGrey,
              isSwitch: switched,
            ),
            _Switch(
              screenHeight: size.height,
              screenWidth: size.width,
              isSwitch: switched,
              onTap: () {
                setState(() {
                  switched = !switched;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LampCable extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final Color color;

  const _LampCable({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.175,
      child: Container(
        color: color,
        width: 30,
        height: screenHeight * 0.10,
      ),
    );
  }
}

class _Lamp extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final Color color;
  final isSwitch;

  const _Lamp({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.color,
    @required this.isSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: screenWidth * 2.1,
      top: screenHeight * 0.10,
      left: -screenWidth * 0.95,
      child: ClipPath(
        clipper: _TrapezoideClipper(),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.25,
              color: color,
            ),
            AnimatedContainer(
              duration: animationDuration,
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                gradient: isSwitch
                    ? LinearGradient(
                        colors: [
                          gradientStartColor.withOpacity(0.6),
                          gradientStartColor.withOpacity(0.3),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrapezoideClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = new Path();
    path.moveTo(size.width * 0.3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.7, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class _Bulb extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final isSwitch;

  const _Bulb({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.isSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.1,
      top: screenHeight * 0.30,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSwitch ? bulbOnColor : bulbOffColor,
        ),
        curve: new Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );
  }
}

class _LampSwith extends StatelessWidget {
  final screenWidth;
  final screenHeight;
  final isSwitch;
  final Color color;

  const _LampSwith({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.isSwitch,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      top: screenWidth * 0.4,
      bottom: isSwitch ? screenHeight * 0.29 : screenHeight * 0.31,
      left: screenWidth * 0.5 - 1,
      width: 2,
      child: Container(
        color: color,
      ),
    );
  }
}

class _Switch extends StatelessWidget {
  final Function onTap;
  final bool isSwitch;
  final screenWidth;
  final screenHeight;

  const _Switch({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.isSwitch,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      bottom: isSwitch ? screenHeight * 0.29 : screenHeight * 0.31,
      left: screenWidth * 0.5 - 15,
      width: 30,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: animationDuration,
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkGrey,
          ),
        ),
      ),
    );
  }
}
