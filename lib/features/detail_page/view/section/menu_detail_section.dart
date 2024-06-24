import 'package:flutter/material.dart';
import 'package:madang/features/detail_page/models/detail_resto_model.dart';

import '../../../../constant/app_text.dart';
import '../widgets/menu_card.dart';

class MenuDetailSection extends StatelessWidget {
  const MenuDetailSection({super.key, this.data});

  final Restaurant? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food',
            style: AppText.text18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: data!.menus.foods.map((e) {
              return MenuCard(data: e);
            }).toList(),
          ),
          const SizedBox(height: 10),
          Text(
            'Drinks',
            style: AppText.text18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: data!.menus.drinks.map((e) {
              return MenuCard(data: e);
            }).toList(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
