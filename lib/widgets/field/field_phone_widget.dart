import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_text.dart';

class FieldPhoneWidget extends StatelessWidget {
  const FieldPhoneWidget({
    super.key,
    this.controller,
    this.textInputAction,
    this.onChange,
  });

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        textAlignVertical: TextAlignVertical.center,
        style: AppText.text24.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textInputAction: textInputAction,
        onChanged: onChange,
        decoration: const InputDecoration(
          focusColor: AppColors.primaryMain,
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
