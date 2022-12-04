import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleLogoWidget extends StatelessWidget {
  final double diameter;
  final Color color;
  final SvgPicture image;
  final double padding;
  const CircleLogoWidget(
      {Key? key,
        required this.diameter,
        required this.color,
        required this.image,
        required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: image,
    );
  }
}