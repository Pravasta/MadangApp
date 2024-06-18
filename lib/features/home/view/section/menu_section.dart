import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'icon': Icons.fastfood,
        'label': 'Food',
        'color': AppColors.primaryMain,
      },
      {
        'icon': Icons.table_restaurant,
        'label': 'Table',
        'color': AppColors.secondary90,
      },
      {
        'icon': Icons.payment_rounded,
        'label': 'Payment',
        'color': AppColors.accent70,
      },
      {
        'icon': Icons.more_horiz,
        'label': 'More',
        'color': AppColors.grey,
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: data.map((e) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.secondary10,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 25,
                    child: Icon(
                      e['icon'],
                      color: e['color'],
                      size: 23,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  e['label'],
                  style: AppText.text14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
