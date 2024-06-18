import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_text.dart';

class DefaultField extends StatelessWidget {
  const DefaultField({
    super.key,
    required this.hintText,
    this.labelText,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.isEnabled = true,
    this.readOnly = false,
    this.controller,
    this.onChanged,
    this.intialText,
    this.isObscure = false,
    this.maxLines = 1,
    this.inputType,
    this.backgroundColor = AppColors.white,
    this.textAlign = TextAlign.start,
    this.validator,
  });

  final String hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final bool isEnabled;
  final bool readOnly;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? intialText;
  final bool isObscure;
  final int maxLines;
  final TextInputType? inputType;
  final Color? backgroundColor;
  final TextAlign textAlign;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        validator: validator,
        enabled: isEnabled,
        readOnly: readOnly,
        controller: controller,
        onChanged: onChanged ?? (value) {},
        textAlign: textAlign,
        cursorColor: AppColors.black,
        initialValue: intialText,
        keyboardType: inputType,
        obscureText: isObscure,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: AppText.text16.copyWith(
            color: AppColors.grey,
          ),
          labelText: labelText,
          labelStyle: AppText.text14,
          floatingLabelStyle: AppText.text14.copyWith(
            color: AppColors.primaryMain,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: AppColors.grey,
            ),
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
          disabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: AppColors.primaryMain,
            ),
          ),
        ),
      ),
    );
  }
}
