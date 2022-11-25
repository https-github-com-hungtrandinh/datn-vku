import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/util/appbar_common.dart';
import '../../../core/util/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const registerPushName = "/RegisterPage";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  Icons.arrow_back_ios,
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
                        Strings.createAtAccount,
                        style: GoogleFonts.actor(
                          fontSize: 34,
                          color: AppColors.colorFFFFFF,
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      _userNameInput(),
                      const SizedBox(
                        height: 20,
                      ),
                      _emailInput(),
                      const SizedBox(
                        height: 20,
                      ),
                      _phone(),
                      const SizedBox(
                        height: 20,
                      ),
                      _passwordInput(),
                      const SizedBox(
                        height: 70,
                      ),
                      _buttonRegister(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 27),
                  child: Text(
                    Strings.descriptionRegister,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.actor(
                        color: AppColors.colorFFFFFF, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (passWord) {},
      decoration: InputDecoration(
          hintText: Strings.password,
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

  Widget _userNameInput() {
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

  Widget _phone() {
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

  Widget _buttonRegister() {
    return ButtonCustom(
      onClick: () {},
      width: double.infinity,
      height: 44,
      text: Strings.signUp,
      border: 22,
      color: AppColors.colorF78361,
    );
  }
}
