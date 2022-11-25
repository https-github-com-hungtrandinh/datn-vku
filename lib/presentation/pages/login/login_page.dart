import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:clean_architecture/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture/presentation/bloc/login/login_event.dart';
import 'package:clean_architecture/presentation/bloc/login/login_state.dart';
import 'package:clean_architecture/presentation/pages/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/util/appbar_common.dart';
import '../../../core/util/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const loginPushName = "/LoginPage";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        Strings.titleLogin,
                        style: GoogleFonts.actor(
                          fontSize: 34,
                          color: AppColors.colorFFFFFF,
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Text(
                        Strings.contentLogin,
                        style: GoogleFonts.actor(
                          fontSize: 17,
                          color: AppColors.colorFFFFFF,
                        ),
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      _emailInput(),
                      const SizedBox(
                        height: 20,
                      ),
                      _passwordInput(),
                      const SizedBox(
                        height: 70,
                      ),
                      _buttonLogin(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 27),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgotPasswordScreen.forgotPasswordPushName);
                    },
                    child: Text(
                      Strings.forgotPassword,
                      style: GoogleFonts.actor(
                          color: AppColors.colorFFFFFF, fontSize: 17),
                    ),
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
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.text,
            onChanged: (password) {
              context.read<LoginBloc>().add(
                  PasswordChanged(password: password));
            },
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
    );
  }

  Widget _emailInput() {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.text,
            onChanged: (email) {
              context.read<LoginBloc>().add(EmailChanged(email: email));
            },
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
    );
  }

  Widget _buttonLogin() {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return ButtonCustom(
            onClick: () {
              context.read<LoginBloc>().add(LoginSummit());
            },
            width: double.infinity,
            height: 44,
            text: Strings.login,
            border: 22,
            color: AppColors.colorF78361,
          );
        }
    );
  }
}
