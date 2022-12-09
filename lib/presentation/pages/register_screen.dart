import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:clean_architecture/presentation/pages/register_slection/register_selection.dart';
import 'package:clean_architecture/presentation/widgets/signup_form_first.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/util/dialog_custom.dart';
import '../../core/util/glow_button.dart';
import '../../core/value/image.dart';
import '../../core/value/strings.dart';
import '../bloc/register/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const registerPushName = "/RegisterPage";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) {
            return previous.registerStatus != current.registerStatus;
          },
          listener: (context, state) {
            if (state.registerStatus == RegisterStatus.loading) {
              DialogCustom().showDialogLoading(context);
            } else if (state.registerStatus == RegisterStatus.error) {
              Navigator.pop(context);
              DialogCustom().showDialogWithContent(context, state.messages);
            } else if (state.registerStatus == RegisterStatus.loaded) {
              Navigator.pop(context);
              Navigator.pushNamed(context,RegisterSelection.registerStepTwoPushName);
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
              _buildRegisterPanel()
            ],
          ),
        ));
  }

  Widget _buildRegisterPanel() {
    return Padding(
      padding: const EdgeInsets.only(top: 87),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        Strings.signUp,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const SignUpFormFirst(),
                    const SizedBox(height: 42),
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
          ),
        );
      }),
    );
  }
}
