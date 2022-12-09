import 'package:flutter/material.dart';

MaterialStateProperty<BorderSide> getBorder(
    Color color, Color colorPressed, bool force) {
  getBorder(Set<MaterialState> states) {
    if (force || states.contains(MaterialState.pressed)) {
      return const BorderSide(color: Colors.transparent);
    } else {
      return BorderSide(color: color, width: 2);
    }
  }

  return MaterialStateProperty.resolveWith(getBorder);
}

MaterialStateProperty<Color> getColor(
    Color color, Color colorPressed, bool force) {
  getColor(Set<MaterialState> states) {
    if (force || states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  }

  return MaterialStateProperty.resolveWith(getColor);
}

Widget buttonAction(
    {required Color color,
    required Color colorFocus,
    required IconData icon,
    required double size,
    required bool state}) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
        backgroundColor: getColor(color, colorFocus, state),
        shape: MaterialStateProperty.all(const CircleBorder()),
        foregroundColor: getColor(colorFocus, color, state),
        side: getBorder(colorFocus, color, state)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Icon(
        icon,
        size: size,
      ),
    ),
  );
}
