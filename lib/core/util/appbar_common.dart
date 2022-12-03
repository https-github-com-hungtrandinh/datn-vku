import 'package:clean_architecture/core/value/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget buttonBack;
  final double height;
  final String? title;

  const CustomAppBar({
    Key? key,
    required this.buttonBack,
    this.height = kToolbarHeight,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ""),
      leading: buttonBack,
      backgroundColor:  Colors.transparent,
    );
  }
}
