import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../widgets/button/default_button.dart';

Widget buttonSubmit(
  BuildContext context,
  String title,
  String subTitle, {
  required String text,
  required dynamic Function() buttonOnTap,
  required dynamic Function() textOnTap,
}) {
  return Column(
    children: [
      DefaultButton(
        title: title,
        color: AppColors.white,
        onTap: buttonOnTap,
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppText.text14.copyWith(
              color: AppColors.grey,
            ),
          ),
          GestureDetector(
            onTap: textOnTap,
            child: Text(
              subTitle,
              style: AppText.text14.copyWith(
                color: AppColors.primary30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    ],
  );
}
