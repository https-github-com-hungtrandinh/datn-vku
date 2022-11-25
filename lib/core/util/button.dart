import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../value/app_color.dart';

class ButtonCustom extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final double border;
  final String text;
  final Color? textColor;
  final VoidCallback? onClick;

  const ButtonCustom({
    Key? key,
    this.height,
    this.width,
    this.textColor= AppColors.colorFFFFFF,
    this.color,
    this.border = 22,
    this.onClick,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(border),
            ),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.actor(
              color: textColor,
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
