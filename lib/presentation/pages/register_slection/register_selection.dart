import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_event.dart';
import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:clean_architecture/presentation/pages/register_slection/major_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/back_button.dart';
import '../../../core/util/glow_button.dart';
import '../../../core/value/app_color.dart';
import '../../../core/value/strings.dart';
import 'birthday_user_selection.dart';
import 'full_name_selection.dart';
import 'gender_selection.dart';

class RegisterStepTwo extends StatefulWidget {
  const RegisterStepTwo({super.key});

  static const registerStepTwoPushName = "/RegisterStepTwoPage";

  @override
  State<RegisterStepTwo> createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.colorC4B1F8,
                    AppColors.colorFDB1D5,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                    return IndexedStack(
                      index: state.registerStep,
                      children: const [
                        FullNameSection(),
                        GenderSection(),
                        BirthdaySection(),
                        MajorSection()
                      ],
                    );
                  }),
                  Positioned(
                    top: 32,
                    left: 32,
                    child: buildBackButton(context),
                  ),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      bottom: 24,
                      child: registerContinue()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget registerContinue() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return GlowButtonWidget(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.85,
        backgroundColor: AppColors.colorA989FF,
        glowColor: AppColors.colorA989FF,
        glowOffset: const Offset(0, 6),
        borderRadius: 30,
        blurRadius: 25,
        onPressed: () {
          context.read<RegisterBloc>().add(RegisterPush());
        },
        child: const Center(
          child: Text(
            Strings.continueAction,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      );
    });
  }
}
