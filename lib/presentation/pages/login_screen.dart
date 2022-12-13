import 'package:clean_architecture/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/util/dialog_custom.dart';
import '../../core/util/glow_button.dart';
import '../../core/value/image.dart';
import '../../core/value/strings.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_state.dart';
import '../widgets/signin_form.dart';
import 'initial.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const loginPushName = "/LoginPage";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocListener<LoginBloc, LoginState>(
          listenWhen: (oldState, newState) {
            return oldState.loginStatus != newState.loginStatus;
          },
          listener: (context, state) {
            if (state.loginStatus == LoginStatus.loading) {
              DialogCustom().showDialogLoading(context);
            } else if (state.loginStatus == LoginStatus.error) {
              Navigator.pop(context);
              DialogCustom().showDialogWithContent(context, state.contentLogin);
            } else if (state.loginStatus == LoginStatus.loaded) {
              Navigator.pushReplacementNamed(context, InitialApp.initialAppPushName);
            }
          },
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageSrc.imageBackgroundSelection),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                //Place it at the top, and not use the entire screen
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Image.asset(
                    ImageSrc.textLogoApp,
                    width: 180,
                  ),
                  backgroundColor: Colors.transparent, //No more green
                  elevation: 0.0, //Shadow gone
                ),
              ),
              _buildLoginPanel()
            ],
          ),
        ));
  }

  Padding _buildLoginPanel() {
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 30, right: 32),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      Strings.login,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SignInForm(),
                  const SizedBox(height: 64),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white,
                                Colors.grey[400]!,
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          Strings.signWith,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
                                Colors.grey[400]!,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  GlowButtonWidget(
                    width: 60,
                    height: 60,
                    backgroundColor: Colors.blue,
                    glowColor: const Color(0xFF9E9E9E).withAlpha(30),
                    glowOffset: const Offset(0, 8),
                    borderRadius: 34,
                    blurRadius: 15,
                    onPressed: () {},
                    child: Center(
                      child: SvgPicture.asset(ImageSrc.iconGmail),
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          minimumSize: Size.zero,
                        ),
                        child: const Text(
                          Strings.signIn,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
