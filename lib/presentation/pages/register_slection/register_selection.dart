import 'package:clean_architecture/core/util/toast.dart';
import 'package:clean_architecture/presentation/pages/register_slection/interest_selection.dart';
import 'package:clean_architecture/presentation/pages/register_slection/lifestyle_selection.dart';
import 'package:clean_architecture/presentation/pages/register_slection/major_selection.dart';
import 'package:clean_architecture/presentation/pages/register_slection/personality_section.dart';
import 'package:clean_architecture/presentation/pages/register_slection/photo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/back_button.dart';
import '../../../core/util/dialog_custom.dart';
import '../../../core/util/glow_button.dart';
import '../../../core/value/app_color.dart';
import '../../../core/value/strings.dart';
import '../../bloc/register_selection/register_selection_bloc.dart';
import '../../bloc/register_selection/register_selection_event.dart';
import '../../bloc/register_selection/register_selection_state.dart';
import '../initial.dart';
import 'birthday_user_selection.dart';
import 'full_name_selection.dart';
import 'gender_selection.dart';

class RegisterSelection extends StatefulWidget {
  const RegisterSelection({super.key});

  static const registerStepTwoPushName = "/RegisterStepTwoPage";

  @override
  State<RegisterSelection> createState() => _RegisterSelectionState();
}

class _RegisterSelectionState extends State<RegisterSelection> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterSelectionBloc,RegisterSelectionState>(
      listenWhen: (previous, current) {
        return previous.registerSelectionStatus != current.registerSelectionStatus;
      },
      listener: (context, state) {
        if (state.registerSelectionStatus == RegisterSelectionStatus.loading) {
          DialogCustom().showDialogLoading(context);
        } else if (state.registerSelectionStatus == RegisterSelectionStatus.error) {
          Navigator.pop(context);
          DialogCustom().showDialogWithContent(context, state.messages);
        } else if (state.registerSelectionStatus == RegisterSelectionStatus.loaded) {
          Navigator.pop(context);
          Navigator.pushNamed(context,InitialApp.initialAppPushName);
        }
      },
      child: WillPopScope(
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
                    BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(
                        builder: (context, state) {
                      return IndexedStack(
                        index: state.registerStep,
                        children: const [
                          FullNameSection(),
                          GenderSection(),
                          BirthdaySection(),
                          MajorSection(),
                          PersonalitySection(),
                          LifestyleSection(),
                          InterestSection(),
                          ProfilePhotoSection()
                        ],
                      );
                    }),
                    Positioned(
                      top: 32,
                      left: 32,
                      child: BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(
                          builder: (context, state) {
                        if (state.registerStep == 0) {
                          return const SizedBox();
                        }
                        return buildBackButton(onClick: () {
                          context.read<RegisterSelectionBloc>().add(RegisterPop());
                        });
                      }),
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
      ),
    );
  }

  Widget registerContinue() {
    return BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(builder: (context, state) {
      return GlowButtonWidget(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.85,
        backgroundColor: AppColors.colorA989FF,
        glowColor: AppColors.colorA989FF,
        glowOffset: const Offset(0, 6),
        borderRadius: 30,
        blurRadius: 25,
        onPressed: () {
          if (state.registerStep < 7) {
            switch (state.registerStep) {
              case 0:
                {
                  if (state.userName.isEmpty) {
                    showToast(msg: Strings.pleaseEnterYourName);
                    return;
                  } else if (state.userName.length > 20) {
                    showToast(msg: Strings.nameSize);
                    return;
                  }
                }
                break;
              case 1:
                {
                  if (state.gender.isEmpty) {
                    showToast(msg: Strings.pleaseEnterGender);
                    return;
                  }
                }
                break;
              case 2:
                {
                  if (state.birthDay ==null) {
                    showToast(msg: Strings.pleaseEnterBirthDay);
                    return;
                  }
                }
                break;
              case 3:
                {
                  if (state.major.isEmpty) {
                    showToast(msg: Strings.pleaseMajor);
                    return;
                  }
                }
                break;
              default:
            }
            context.read<RegisterSelectionBloc>().add(RegisterPush());
          } else {
            context.read<RegisterSelectionBloc>().add(SummitSelectionRegister());
          }
        },
        child: Center(
          child: Text(
            state.registerStep == 7 ? Strings.summit : Strings.continueAction,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      );
    });
  }
}
