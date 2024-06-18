import 'package:flutter/material.dart';
import 'package:madang/common/routes/routes_name.dart';

import 'package:madang/constant/app_text.dart';
import 'package:madang/features/home/models/restaurant_model.dart';

import '../widget/resto_card.dart';

class RestaurantSection extends StatelessWidget {
  const RestaurantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Restaurant',
              style: AppText.text18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: RestaurantModel.restoModel.map((e) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RoutesName.detailPage);
                  },
                  child: RestoCard(data: e),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
