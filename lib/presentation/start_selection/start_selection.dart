import 'package:clean_architecture/core/util/button.dart';
import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/presentation/pages/login/login_page.dart';
import 'package:clean_architecture/presentation/pages/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/value/strings.dart';

class StartSelection extends StatefulWidget {
  const StartSelection({Key? key}) : super(key: key);
  static const startSelection = "/StartSelection";

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
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      Text(
                        Strings.titleStartScreen,
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.w700,
                              color: AppColors.colorFFFFFF),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        Strings.contentStartScreen,
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorFFFFFF),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      _buttonLogin(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buttonRegister(),
                      const SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                Strings.byMe,
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.color4E586E),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 54),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageSrc.iconFacebook),
                    const SizedBox(
                      width: 13,
                    ),
                    SvgPicture.asset(ImageSrc.iconTwitter),
                    const SizedBox(
                      width: 13,
                    ),
                    SvgPicture.asset(ImageSrc.iconGmail),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonLogin() {
    return ButtonCustom(
      width: double.infinity,
      textColor: AppColors.colorFF2D55,
      height: 44,
      text: Strings.login,
      color: AppColors.colorFFFFFF,
      onClick: () {
        Navigator.pushNamed(context, LoginScreen.loginPushName);
      },
    );
  }

  Widget _buttonRegister() {
    return ButtonCustom(
      width: double.infinity,
      height: 44,
      text: Strings.signUp,
      color: AppColors.colorF78361,
      onClick: () {
        Navigator.pushNamed(context, RegisterScreen.registerPushName);
      },
    );
  }
}
