import 'package:clean_architecture/core/value/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/models/firebase/lifestyle.dart';

class MarkCardWidget extends FormField<bool> {
  final LifestyleQuestionModel text;
  final Function(bool) onTap;

  MarkCardWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required FormFieldSetter<bool> onSaved,
    required FormFieldValidator<bool> validator,
    bool initialValue = false,
    AutovalidateMode autoValidate = AutovalidateMode.disabled,
    bool enabled = true,
  }) : super(
      key: key,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: autoValidate,
      enabled: enabled,
      builder: (state) {
        return InkWell(
          onTap: () {
            state.didChange(state.value == true ? false : true);
            onTap(state.value ?? false);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 19,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        right: 18,
                        left: 32,
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(2, 0),
                          ),
                        ],
                      ),
                      child: Text(
                        text.question,
                        style:const TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: state.value ?? false
                        ? AppColors.kPrimaryPurple[100]
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(2, 0),
                      ),
                    ],
                  ),
                  child: state.value ?? false
                      ? const Icon(Icons.check_rounded,
                      color: Colors.white)
                      : Container(),
                ),
              )
            ],
          ),
        );
      });
}
