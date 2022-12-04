import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/util/appbar_common.dart';
import '../../core/util/button.dart';
import '../../core/util/dialog_custom.dart';
import '../bloc/register/register_state.dart';
import 'initial.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const registerPushName = "/RegisterPage";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous,current){
       return (previous.registerStatus != current.registerStatus);

      },
      listener: (context,state){
        if (state.registerStatus == RegisterStatus.loading) {
          DialogCustom().showDialogLoading(context);
        } else if (state.registerStatus  == RegisterStatus.error) {
          Navigator.pop(context);
          DialogCustom().showDialogWithContent(context,state.messages);
        } else if (state.registerStatus  ==RegisterStatus.loaded) {
          Navigator.pushNamed(context, InitialApp.initialAppPushName);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              ImageSrc.imageBackgroundSelection,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
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
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child:Column(
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
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordInput() {
    return  BlocBuilder<RegisterBloc,RegisterState>(
        builder: (context,state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          onChanged: (password) {
            context.read<RegisterBloc>().add(ChangedPasswordRegister(password));
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
    return  BlocBuilder<RegisterBloc,RegisterState>(
        builder: (context,state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          onChanged: (email) {
            context.read<RegisterBloc>().add(ChangedEmailRegister(email));
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

  Widget _userNameInput() {
    return BlocBuilder<RegisterBloc,RegisterState>(
        builder: (context,state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          onChanged: (nameUser) {
            context.read<RegisterBloc>().add(ChangedNameUserRegister(nameUser));
          },
          decoration: InputDecoration(
              hintText: Strings.userName,
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

  Widget _phone() {
    return BlocBuilder<RegisterBloc,RegisterState>(
      builder: (context,state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          onChanged: (numberPhone) {
            context.read<RegisterBloc>().add(ChangedPhoneNumberRegister(numberPhone));
          },
          decoration: InputDecoration(
              hintText: Strings.phone,
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

  Widget _buttonRegister() {
    return BlocBuilder<RegisterBloc,RegisterState>(
      builder: (context,state) {
        return ButtonCustom(
          onClick: () {
            context.read<RegisterBloc>().add(RegisterSummit());
          },
          width: double.infinity,
          height: 44,
          text: Strings.signUp,
          border: 22,
          color: AppColors.colorF78361,
        );
      }
    );
  }
}
