import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_event.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value/strings.dart';

class InterestSection extends StatefulWidget {
  const InterestSection({Key? key}) : super(key: key);

  @override
  State<InterestSection> createState() => _InterestSectionState();
}

class _InterestSectionState extends State<InterestSection> {
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
            Strings.choseInterest,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 32),
          BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(
              builder: (context, state) {
            return Wrap(
              children: state.listInterest.map(
                (interestModel) {
                  final bool isSelected = state.interest.contains(interestModel.interest);

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(interestModel.interest),
                      selected: isSelected,
                      pressElevation: 0,
                      backgroundColor: Colors.white,
                      selectedColor: AppColors.kPrimaryPurple[100],
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                      checkmarkColor: Colors.white,
                      onSelected: (value) {
                        if (value) {
                        context.read<RegisterSelectionBloc>().add(ChangedAddInterestEvent(interestModel.interest));
                        } else {
                          context.read<RegisterSelectionBloc>().add(ChangedRemoveInterestEvent(interestModel.interest));
                        }
                        setState(() {});
                      },
                    ),
                  );
                },
              ).toList(),
            );
          }),
        ],
      ),
    );
  }
}
