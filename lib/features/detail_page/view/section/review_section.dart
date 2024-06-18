import 'package:flutter/material.dart';
import '../../../../constant/app_text.dart';
import '../../../home/models/restaurant_model.dart';
import '../widgets/menu_card.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review Customers',
            style: AppText.text18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: RestaurantModel.restoModel.map((e) {
              return MenuCard(data: e);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
