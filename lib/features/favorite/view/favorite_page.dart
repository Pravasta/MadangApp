import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/url_assets.dart';
import 'package:madang/features/home/models/restaurant_model.dart';
import '../../../constant/app_text.dart';
import '../../../widgets/resto/global_resto_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          'Favorite',
          style: AppText.text20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: done(),
    );
  }

  Widget done() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: RestaurantModel.restoModel.map((e) {
            return GlobalRestoWidget(data: e);
          }).toList(),
        ),
      ),
    );
  }

  Widget initial() {
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
