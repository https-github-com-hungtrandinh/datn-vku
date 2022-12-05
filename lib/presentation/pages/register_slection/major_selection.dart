import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value/strings.dart';
import '../../bloc/register/register_state.dart';

class MajorSection extends StatelessWidget {
  const MajorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 95),
          Expanded(
            child: Center(
              child: _majorInput()
            ),
          ),
          const SizedBox(height: 92),
        ],
      ),
    );
  }

  Widget nameUser() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Text(
        "${Strings.alright} ${state.userName}${Strings.whatIsMajor}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      );
    });
  }
  Widget _majorInput(){
    return  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
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
            hintText: Strings.yourMaJor,
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
      }
    );
  }
}
