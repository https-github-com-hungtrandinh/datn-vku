import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value/strings.dart';

class BirthdaySection extends StatelessWidget {
  const BirthdaySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 95),
          _nameUser(),
          Expanded(
            child: Center(child: _textInputBirthDay()),
          ),
          const SizedBox(height: 92),
        ],
      ),
    );
  }

  Widget _textInputBirthDay() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        readOnly: true,
        onTap: () {},
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          hintText: Strings.yourBirthDay,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
        ),
      );
    });
  }

  Widget _nameUser() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (builder, state) {
      return Text(
        "${Strings.niceToMissYou}${state.userName}${Strings.whatIsBirthDay}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      );
    });
  }
}
