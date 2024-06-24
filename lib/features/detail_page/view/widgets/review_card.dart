import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../constant/url_assets.dart';
import '../../models/detail_resto_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.data});

  final CustomerReview data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
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
          Image.asset(UrlAssets.profile, scale: 5),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.review,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
