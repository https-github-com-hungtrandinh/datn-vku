import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String title;

  const LabelText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: Colors.black)),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
