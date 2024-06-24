import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/constant/url_assets.dart';

import '../../models/detail_resto_model.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.data});

  final Category? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1 / 9,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              UrlAssets.menu,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              data?.name ?? '',
              style: AppText.text16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.grey,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
