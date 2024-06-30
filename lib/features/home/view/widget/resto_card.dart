import 'package:flutter/material.dart';
import 'package:madang/constant/app_url.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';

class RestoCard extends StatelessWidget {
  const RestoCard({super.key, required this.data});

  final Restaurants data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.grey,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              '${AppUrl.restoImage}/${data.pictureId}',
              width: MediaQuery.of(context).size.width * 2 / 8,
              height: MediaQuery.of(context).size.width * 2 / 8,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppText.text16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(data.city,
                    style: AppText.text14.copyWith(
                        fontWeight: FontWeight.w700, color: AppColors.grey))
              ],
            ),
          ),
          Column(
            children: [
              const Icon(Icons.star, color: Colors.orange),
              Text(
                '${data.rating}',
                style: AppText.text16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}
