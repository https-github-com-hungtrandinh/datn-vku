import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_event.dart';
import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import '../../../core/value/app_color.dart';
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
        controller: TextEditingController(text: state.birthDay),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        readOnly: true,
        onTap: () {
          setBirthday(context);
        },
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

  Future<void> setBirthday(BuildContext context) async {
    DateTime? birthday = await showRoundedDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        borderRadius: 16,
        height: 280,
        theme: ThemeData(
          primarySwatch: AppColors.purplePallete,
        ));

    if (birthday != null) {
      context.read<RegisterBloc>().add(ChangedBirthDay(
          "${birthday.day}-${birthday.month}-${birthday.year}"));
    }
  }
}
