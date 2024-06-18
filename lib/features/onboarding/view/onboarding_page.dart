import 'package:flutter/material.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/constant/url_assets.dart';
import 'package:madang/widgets/button/default_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Madang',
                  style: AppText.text26.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: AppColors.primaryMain,
                  ),
                ),
                Text(
                  'Book a food from everywhere.',
                  style: AppText.text18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                DefaultButton(
                  title: 'Register',
                  onTap: () {
                    Navigator.of(context).pushNamed(RoutesName.register);
                  },
                  color: AppColors.white,
                ),
                const SizedBox(height: 10),
                DefaultButton(
                  title: 'Login',
                  elevation: 0,
                  onTap: () {
                    Navigator.of(context).pushNamed(RoutesName.login);
                  },
                  backgroundColor: AppColors.white,
                  color: AppColors.primaryMain,
                ),
                const SizedBox(height: 10),
                DefaultButton(
                  title: 'Login',
                  iconUrl: UrlAssets.googleLogo,
                  elevation: 0,
                  onTap: () {},
                  backgroundColor: AppColors.white,
                  color: AppColors.primaryMain,
                )
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
