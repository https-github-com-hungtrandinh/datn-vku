import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/util/appbar_common.dart';
import '../../core/util/button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const forgotPasswordPushName = "/ForgotPasswordPage";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
          Align(
            alignment: Alignment.topCenter,
            child: CustomAppBar(
              height: 87,
              buttonBack: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.colorFFFFFF,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 105,
                      ),
                      Text(
                        Strings.forgotPassword,
                        style: GoogleFonts.actor(
                          fontSize: 34,
                          color: AppColors.colorFFFFFF,
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Text(
                        Strings.contentForgotPassword,
                        style: GoogleFonts.actor(
                          fontSize: 17,
                          color: AppColors.colorFFFFFF,
                        ),
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                      _emailInput(),
                      const SizedBox(
                        height: 40,
                      ),
                      _buttonSeen(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 27),
                  child: Text(
                    Strings.forgotPassword,
                    style: GoogleFonts.actor(
                        color: AppColors.colorFFFFFF, fontSize: 17),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (email) {},
      decoration: InputDecoration(
          hintText: Strings.email,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          fillColor: Colors.white24),
    );
  }

  Widget _buttonSeen() {
    return ButtonCustom(
      onClick: () {},
      width: double.infinity,
      height: 44,
      text: Strings.send,
      border: 22,
      color: AppColors.colorF78361,
    );
  }
}
