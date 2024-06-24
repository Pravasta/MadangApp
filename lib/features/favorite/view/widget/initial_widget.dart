import 'package:flutter/material.dart';

import '../../../../constant/app_text.dart';
import '../../../../constant/url_assets.dart';

class FavoriteInitialWidget extends StatelessWidget {
  const FavoriteInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              UrlAssets.restaurant,
              scale: 4,
            ),
            const SizedBox(height: 20),
            Text(
              'Not have favorite item, Please add for see Favorite',
              textAlign: TextAlign.center,
              style: AppText.text18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
