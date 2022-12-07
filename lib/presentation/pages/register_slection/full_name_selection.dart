import 'package:clean_architecture/core/value/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value/strings.dart';
import '../../bloc/register_selection/register_selection_bloc.dart';
import '../../bloc/register_selection/register_selection_event.dart';
import '../../bloc/register_selection/register_selection_state.dart';



class FullNameSection extends StatelessWidget {
  const FullNameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 95),
          const Text(
            Strings.contentYourName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: Center(child: _inputNameUser()),
          ),
          const SizedBox(height: 92),
        ],
      ),
    );
  }

  Widget _inputNameUser() {
    return BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(builder: (context, state) {
      return TextFormField(
        onChanged: (userName){
          context.read<RegisterSelectionBloc>().add(ChangedNameUserRegister(userName));
        },
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        cursorColor: AppColors.kPrimaryPurple[100],
        cursorHeight: 25,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          hintText: Strings.yourName,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          errorStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.kAccentColor['red']!,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: AppColors.kAccentColor['red']!, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: AppColors.kAccentColor['red']!, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
        ),
      );
    });
  }
}
