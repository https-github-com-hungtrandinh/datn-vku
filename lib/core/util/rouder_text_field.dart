import 'package:clean_architecture/core/value/app_color.dart';
import 'package:flutter/material.dart';

class RoundedTextFieldWidget extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? errorText;
  final TextEditingController? controller;

  const RoundedTextFieldWidget({
    Key? key,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    required this.hintText,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.obscureText = false,
    this.suffixIcon,
    this.initialValue,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      initialValue: initialValue,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black54
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.colorC8C8C8,
        ),
        errorStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.kAccentColor['red']!,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: AppColors.kPrimaryPurple[100]!, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: AppColors.kAccentColor['red']!, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: AppColors.kAccentColor['red']!, width: 1.5),
        ),
        filled: true,
        fillColor: AppColors.kGrayColor[20]!,
        suffixIcon: suffixIcon,
      ),
      cursorColor: AppColors.kPrimaryPurple[100]!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
