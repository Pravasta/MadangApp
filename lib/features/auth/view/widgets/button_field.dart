import 'package:flutter/material.dart';

import '../../../../constant/app_text.dart';
import '../../../../widgets/field/default_field.dart';

Widget buttonField(
  BuildContext context,
  String title, {
  bool? isObsecure,
  Icon? suffixIcon,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppText.text14.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        DefaultField(
          hintText: title,
          isObscure: isObsecure ?? false,
          suffixIcon: suffixIcon,
          controller: controller,
          validator: validator,
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
