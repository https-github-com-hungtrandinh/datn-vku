import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../data/models/firebase/personality.dart';
import '../../widgets/dot_loading.dart';
import '../../widgets/personality_card_widget.dart';

class PersonalitySection extends StatelessWidget {

  PersonalitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.direction == ScrollDirection.forward ||
            notification.direction == ScrollDirection.reverse) {
          _controller.isScrolling.value = true;
        } else if (notification.direction == ScrollDirection.idle) {
          Future.delayed(const Duration(milliseconds: 1000),
                  () => _controller.isScrolling.value = false);
        }

        return false;
      },

      child:ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 32),

          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount:12,
          itemBuilder: (context, index) {
            final questionData = data[index];

            if (index == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 95),
                  const Text(
                    "Choose your best answer based on your own personality",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "1 if you dissagree, 5 if you agree",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildQuestionCard(questionData, index),
                ],
              );
            } else if (index == data.length - 1) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: _buildQuestionCard(questionData, index),
              );
            } else {
              return _buildQuestionCard(questionData, index);
            }
          },
        ),
      );

  }

  Padding _buildQuestionCard(PersonalityQuestion questionData, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: PersonalityCardWidget(
        question: questionData.question,
        initialValue: ((questionData.scaleAnswers ?? 1).toDouble() - 1) / 4,
        onChanged: (value) {
          _controller.updatePersonalityAnswer(index, value ?? 0);
        },
      ),
    );
  }
}