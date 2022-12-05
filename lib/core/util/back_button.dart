import 'package:flutter/material.dart';

Widget buildBackButton(BuildContext context) {
  return OutlinedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    style: OutlinedButton.styleFrom(
      fixedSize: const Size(40, 40),
      minimumSize: Size.zero,
      backgroundColor: Colors.white.withOpacity(0.8),
      padding: EdgeInsets.zero,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Icon(
      Icons.arrow_back,
      color: Colors.black.withOpacity(0.8),
      size: 22,
    ),
  );
}
