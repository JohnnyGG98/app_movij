import 'package:app_movij/models/button_bottom_model.dart';
import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final Function(int page) onChange;

  const AnimatedBottomBar({
    Key key,
    @required this.onChange,
  }) : super(key: key);

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedPage = 0;
  final Duration colorDuration = const Duration(milliseconds: 300);
  final Duration sizeDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _items(),
        ),
      ),
    );
  }

  List<Widget> _items() {
    return buttonsBottom.map(_getButton).toList();
  }

  Widget _getButton(ButtonBottomModel button) {
    final bool isSelected = selectedPage == button.page;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        if (selectedPage != button.page) {
          setState(() {
            selectedPage = button.page;
            widget.onChange(button.page);
          });
        }
      },
      child: AnimatedContainer(
        duration: colorDuration,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? button.color.withOpacity(0.15)
              : Colors.black45.withOpacity(0.15),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              button.icon,
              color: isSelected ? button.color : Colors.black45,
              size: 22,
            ),
            if (isSelected) SizedBox(width: 10),
            AnimatedSize(
              duration: sizeDuration,
              curve: Curves.easeInOut,
              vsync: this,
              child: Text(
                isSelected ? button.label : '',
                style: TextStyle(
                  color: isSelected ? button.color : Colors.black45,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
