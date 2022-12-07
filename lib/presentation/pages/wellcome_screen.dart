import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture/presentation/bloc/login/login_event.dart';
import 'package:clean_architecture/presentation/bloc/login/login_state.dart';
import 'package:clean_architecture/presentation/pages/register_screen.dart';
import 'package:clean_architecture/presentation/pages/register_slection/register_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/util/button_logo_widget.dart';
import '../../core/util/circle_logo.dart';
import '../../core/value/strings.dart';
import 'login_screen.dart';


class WelcomePage extends StatefulWidget {
  static const String routeName = "/welcome-page";

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageSrc.imageBackgroundSelection),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 36),
                      Image.asset(
                        ImageSrc.textLogoApp,
                        height: 36,
                        width: 173,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        width: 137,
                        height: 137,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        Strings.collegeMatch,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            fontSize: 32),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 240,
                        child: Text(
                          Strings.contentStartScreen,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _signInWithGoogleButton(),
                    const SizedBox(height: 18),
                    _signInWithEmail(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Strings.dontHaveAccount,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.registerPushName);
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(left: 4),
                              minimumSize: Size.zero),
                          child: const Text(
                            Strings.signUp,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  BlocBuilder<LoginBloc, LoginState> _signInWithGoogleButton() {
    return  BlocBuilder<LoginBloc,LoginState>(
      builder: (context,state) {
        return ButtonLogoWidget(
          height: 58,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(11),
          logo: CircleLogoWidget(
              diameter: 38,
              color: Colors.red,
              image: SvgPicture.asset(ImageSrc.iconGmail),
              padding: 8),
          color: Colors.white.withOpacity(0.58),
          text: Strings.signWithGoogle,
          onTap: () {
            context.read<LoginBloc>().add(LoginWithGoogle());
          },
        );
      }
    );
  }

  ButtonLogoWidget _signInWithEmail() {
    return ButtonLogoWidget(
      height: 58,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(11),
      logo: CircleLogoWidget(
        diameter: 38,
        color: Colors.blueAccent,
        image: SvgPicture.asset(ImageSrc.iconFacebook),
        padding: 8,
      ),
      color: Colors.black,
      text: Strings.signWithEmail,
      textColor: Colors.white,
      onTap: () {
        Navigator.pushNamed(context, LoginScreen.loginPushName);
      },
    );
  }
}
