import 'package:flutter/material.dart';
import '../../core/value/app_color.dart';

class MessageTextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onSendPressed;
 final  TextEditingController textEditingController;

  const MessageTextFieldWidget({
    Key? key,
    required this.onChanged,
    required this.onSendPressed, required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged:onChanged,
      maxLines: null,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintText: 'Type a message...',
        hintStyle: const TextStyle(
          color: Color(0xFFADADAD),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Color(0xFFE6E6E6), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide:
              BorderSide(color: AppColors.kPrimaryPurple[100]!, width: 1),
        ),
        filled: true,
        fillColor: AppColors.kGrayColor[10]!,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed:onSendPressed,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      cursorColor: AppColors.kPrimaryPurple[100]!,
    );
  }
}
