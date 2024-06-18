import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/url_assets.dart';
import 'package:madang/features/home/models/restaurant_model.dart';
import 'package:madang/widgets/field/default_field.dart';

import '../../../constant/app_text.dart';
import '../../../widgets/resto/global_resto_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 1 / 7),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: AppColors.white,
              backgroundColor: AppColors.white,
              title: Text(
                'Search',
                style: AppText.text20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: DefaultField(
                hintText: 'Search food',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ],
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
}
