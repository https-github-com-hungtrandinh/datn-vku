import 'package:clean_architecture/core/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/util/glow_button.dart';
import '../../core/util/rouder_text_field.dart';
import '../../core/value/app_color.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _emailInput(),
              const SizedBox(height: 24),
              _passwordInput(),
              const SizedBox(height: 32),
              _summitSignIn()
            ],
          ),
        ),
      ],
    );
  }

  Widget _emailInput() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return RoundedTextFieldWidget(
          hintText: Strings.email,
          onChanged: (email) {
            context.read<LoginBloc>().add(EmailChanged(email: email));
          },
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          errorText: state.validateEmail ? Strings.emailValidate : null);
    });
  }

  Widget _passwordInput() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return RoundedTextFieldWidget(
          hintText: Strings.password,
          onChanged: (password) {
            context.read<LoginBloc>().add(PasswordChanged(password: password));
          },
          obscureText: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          errorText: state.validatePassword ? Strings.passWordValidate : null);
    });
  }

  Widget _summitSignIn() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return GlowButtonWidget(
        height: 60,
        width: double.infinity,
        backgroundColor: const Color(0xFFA989FF),
        glowColor: AppColors.kPrimaryPurple[100]!,
        glowOffset: const Offset(0, 6),
        borderRadius: 12,
        blurRadius: 22,
        onPressed: () {
          if(!state.validatePassword && !state.validateEmail){
            context.read<LoginBloc>().add(LoginSummit());
          }

        },
        child: const Center(
          child: Text(
            Strings.signUp,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
          ),
        ),
      );
    });
  }
}
