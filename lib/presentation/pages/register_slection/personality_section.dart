import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_event.dart';
import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value/strings.dart';
import '../../../data/models/firebase/personality.dart';
import '../../widgets/personality_card_widget.dart';

class PersonalitySection extends StatelessWidget {
  const PersonalitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: state.listPersonalityQuestion.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 95),
                const Text(
                  Strings.choose,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  Strings.selectionIf,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 32),
                _buildQuestionCard(state.listPersonalityQuestion[index], index),
              ],
            );
          } else if (index == state.listPersonalityQuestion.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: _buildQuestionCard(
                  state.listPersonalityQuestion[index], index),
            );
          } else {
            return _buildQuestionCard(
                state.listPersonalityQuestion[index], index);
          }
        },
      );
    });
  }

  Widget _buildQuestionCard(PersonalityQuestion questionData, int index) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: PersonalityCardWidget(
          question: questionData.question,
          initialValue: ((questionData.scaleAnswers ?? 1).toDouble() - 1) / 4,
          onChanged: (value) {
            context
                .read<RegisterBloc>()
                .add(ChangedAnswerPersonality(value!.toInt()));
          },
        ),
      );
    });
  }
}
