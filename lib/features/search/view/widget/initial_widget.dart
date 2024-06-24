import 'package:flutter/material.dart';

import '../../../../constant/app_text.dart';
import '../../../../constant/url_assets.dart';

Widget initial() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        UrlAssets.restaurant,
        scale: 4,
      ),
      const SizedBox(height: 10),
      Text(
        'Let\'s Search',
        style: AppText.text22.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 100),
    ],
  ));
}
