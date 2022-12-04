import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:clean_architecture/core/value/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/value/app_color.dart';
import '../../../core/value/strings.dart';
import '../../bloc/register_selection/register_selection_bloc.dart';
import '../../bloc/register_selection/register_selection_event.dart';
import '../../bloc/register_selection/register_selection_state.dart';

class GenderSection extends StatelessWidget {
  const GenderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 95),
          const Expanded(
            flex: 2,
            child: Text(
              Strings.whatIsGender,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: AspectRatio(aspectRatio: 1, child: labelGender()),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child:
                      AspectRatio(aspectRatio: 1, child: labelGenderFeMale()),
                ),
                const SizedBox(height: 92),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget labelGender() {
    return BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(builder: (context, state) {
      return BouncingWidget(
        onPressed: () {
          context
              .read<RegisterSelectionBloc>()
              .add(ChangedMaleUserRegister(Strings.male));
        },
        duration: const Duration(milliseconds: 200),
        scaleFactor: 2,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: state.gender == Strings.male
                ? AppColors.kPrimaryPurple[100]
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    ImageSrc.male,
                    color: state.gender == Strings.male
                        ? Colors.white
                        : AppColors.kPrimaryPurple[100],
                  ),
                ),
              ),
              Text(
                Strings.male,
                style: TextStyle(
                  color: state.gender == Strings.male
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget labelGenderFeMale() {
    return BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(builder: (context, state) {
      return BouncingWidget(
        onPressed: () {
          context
              .read<RegisterSelectionBloc>()
              .add(ChangedMaleUserRegister(Strings.female));
        },
        duration: const Duration(milliseconds: 200),
        scaleFactor: 2,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: state.gender == Strings.female
                ? AppColors.kPrimaryPink[100]
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  ImageSrc.feMale,
                  color: state.gender == Strings.female
                      ? Colors.white
                      : AppColors.kPrimaryPink[100],
                ),
              ),
              Text(
                Strings.female,
                style: TextStyle(
                  color: state.gender == Strings.female
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
