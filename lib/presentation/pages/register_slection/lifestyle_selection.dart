import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/value/strings.dart';
import '../../../data/models/firebase/lifestyle.dart';
import '../../widgets/mark_card_widget.dart';

class LifestyleSection extends StatelessWidget {
  const LifestyleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {

      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: state.listLifestyleQuestion.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 95),
                const Text(
                  Strings.markAnswers,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 32),
                _buildQuestionCard(state.listLifestyleQuestion[index], index),
              ],
            );
          } else if (index == state.listLifestyleQuestion.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child:
                  _buildQuestionCard(state.listLifestyleQuestion[index], index),
            );
          } else {
            return _buildQuestionCard(
                state.listLifestyleQuestion[index], index);
          }
        },
      );
    });
  }

  Widget _buildQuestionCard(
      LifestyleQuestionModel lifestyleQuestion, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: MarkCardWidget(
        text: lifestyleQuestion,
        initialValue: lifestyleQuestion.answer ?? false,
        validator: (value) => null,
        onSaved: (value) {},
        onTap: (value) {

        },
      ),
    );
  }
}
