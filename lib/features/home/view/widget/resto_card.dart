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
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: AppColors.grey,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network('${AppUrl.restoImage}/${data.pictureId}',
                    width: MediaQuery.of(context).size.width * 2 / 5 + 3,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 2 / 9)),
            Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: AppText.text14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(data.city,
                          style: AppText.text12.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.grey))
                    ]))
          ],
        ),
      ),
      Positioned(
          top: 0,
          right: 0,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: const BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 3),
                  Text('${data.rating}',
                      style: AppText.text12.copyWith(color: AppColors.white))
                ],
              )))
    ]);
  }
}
