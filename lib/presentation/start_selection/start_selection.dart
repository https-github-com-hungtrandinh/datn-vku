import 'package:clean_architecture/core/value/image.dart';
import 'package:flutter/material.dart';

class StartSelection extends StatefulWidget {
  const StartSelection({Key? key}) : super(key: key);

  @override
  State<StartSelection> createState() => _StartSelectionState();
}

class _StartSelectionState extends State<StartSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageSrc.imageBackgroundSelection,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
