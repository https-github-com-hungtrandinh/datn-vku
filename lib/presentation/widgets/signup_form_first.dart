import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/util/glow_button.dart';
import '../../core/util/rouder_text_field.dart';
import '../bloc/register/register_bloc.dart';
import '../bloc/register/register_event.dart';
import '../bloc/register/register_state.dart';

class SignUpFormFirst extends StatelessWidget {
  const SignUpFormFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          child: Column(
            children: [
              _emailInput(),
              const SizedBox(height: 24),
              _passwordInput(),
              const SizedBox(height: 24),
              _passwordConfirm(),
              const SizedBox(height: 24),
              _summit(),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ],
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return RoundedTextFieldWidget(
        hintText: Strings.password,
        onChanged: (password) {
          context.read<RegisterBloc>().add(ChangedPasswordRegister(password));
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        obscureText: true,
        errorText: state.emailValidate ? Strings.emailValidate : null,
      );
    });
  }

  Widget _emailInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return RoundedTextFieldWidget(
        hintText: Strings.email,
        onChanged: (email) {
          context.read<RegisterBloc>().add(ChangedEmailRegister(email));
        },
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        errorText: state.emailValidate ? Strings.emailValidate : null,
      );
    });
  }

  Widget _passwordConfirm() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return RoundedTextFieldWidget(
        hintText: Strings.confirmPassword,
        onChanged: (confirmPassword) {},
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        obscureText: true,
        errorText: state.passwordValidate ? Strings.passWordValidate : null,
      );
    });
  }

  Widget _summit() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return GlowButtonWidget(
        height: 60,
        width: double.infinity,
        backgroundColor: AppColors.colorA989FF,
        glowColor: AppColors.kPrimaryPurple[100]!,
        glowOffset: const Offset(0, 6),
        borderRadius: 12,
        blurRadius: 22,
        onPressed: () {
          if(!state.emailValidate && !state.passwordValidate) {
            context.read<RegisterBloc>().add(RegisterSummit());
          }
        },
        child: const Center(
          child: Text(
            Strings.continueAction,
            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize:18 ),
          ),
        ),
      );
    });
  }
}
