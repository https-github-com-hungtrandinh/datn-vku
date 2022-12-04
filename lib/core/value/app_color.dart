import 'package:flutter/material.dart';

class AppColors {
  static const Color bgNav = Color(0xff111111);
  static const Color endBgAppbar = Color(0xffa3a2a5);
  static const Color beginBgAppbar = Color(0xff000000);
  static const Color midBgAppbar = Color(0xff3f3d3f);
  static const Color colorFF2D55 = Color(0xffFF2D55);
  static const Color colorFFFFFF = Color(0xffFFFFFF);
  static const Color color242A37 = Color(0xff242A37);
  static const Color colorF78361 = Color(0xffF78361);
  static const Color colorF54B64 = Color(0xffF54B64);
  static const Color color0A1F44 = Color(0xff0A1F44);
  static const Color color4E586E = Color(0xff4E586E);
  static const Color color00000000 = Color(0x00ffffff);
  static const Color primary = Color(0xFFFD5C61);
  static const Color yellowOne = Color(0xFFeec365);
  static const Color yellowTwo = Color(0xFFde9024);
  static const Color primaryOne = Color(0xFFfc3973);
  static const Color primaryTwo = Color(0xFFfd5f60);
  static const Color colorC8C8C8=Color(0xFFC8C8C8);
  static const Color colorA989FF =Color(0xFFA989FF);
  static const Color colorC4B1F8 =Color(0xFFC4B1F8);
  static const Color colorFDB1D5 =Color(0xFFFDB1D5);

  static const Map<int, Color> kPrimaryPurple = {
    100: Color(0xFFC4B1F8),
    80: Color(0xFFD2C4F6),
    50: Color(0xFFDED6F4),
    20: Color(0xFFF2EEFC)
  };

  static const Map<int, Color> kPrimaryPink = {
    100: Color(0xFFFDB1D5),
    80: Color(0xFFFFD4E9),
    50: Color(0xFFFFEAF4),
    20: Color(0xFFFFF5FA)
  };

  static const Map<int, Color> kTyphographyColor = {
    100: Color(0xFF1A1D26),
    80: Color(0xFF2A2F3D),
    50: Color(0xFF4D5364),
    20: Color(0xFF6E7489)
  };

  static const Map<int, Color> kGrayColor = {
    100: Color(0xFF9A9FAE),
    80: Color(0xFFA8ACB9),
    50: Color(0xFFC4C7D0),
    20: Color(0xFFEBEBEB),
    10: Color(0xFFF4F4F4)
  };

  static const Map<String, Color> kAccentColor = {
    "red": Color(0xFFFF3666),
  };

  static const MaterialColor purplePallete =
  MaterialColor(_purplePalletePrimaryValue, <int, Color>{
    50: Color(0xFFF5F1FF),
    100: Color(0xFFE5DCFF),
    200: Color(0xFFD4C4FF),
    300: Color(0xFFC3ACFF),
    400: Color(0xFFB69BFF),
    500: Color(_purplePalletePrimaryValue),
    600: Color(0xFFA281FF),
    700: Color(0xFF9876FF),
    800: Color(0xFF8F6CFF),
    900: Color(0xFF7E59FF),
  });
  static const int _purplePalletePrimaryValue = 0xFFA989FF;

  static const MaterialColor purplePalleteAccent =
  MaterialColor(_purplePalleteAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_purplePalleteAccentValue),
    400: Color(0xFFFEFDFF),
    700: Color(0xFFEAE4FF),
  });
  static const int _purplePalleteAccentValue = 0xFFFFFFFF;

}
