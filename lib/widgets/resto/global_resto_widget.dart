import 'package:flutter/material.dart';
import 'package:madang/constant/app_url.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text.dart';

class GlobalRestoWidget extends StatelessWidget {
  const GlobalRestoWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.city,
    required this.rating,
    this.isFavorite = false,
    this.onTap,
  });

  final String imageUrl;
  final String name;
  final String city;
  final double rating;
  final bool isFavorite;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 5,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    '${AppUrl.restoImage}/$imageUrl',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: AppText.text16
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Text(city,
                              style: AppText.text14.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < rating; i++)
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          isFavorite
              ? Positioned(
                  top: 4,
                  right: 4,
                  child: CircleAvatar(
                      backgroundColor: AppColors.secondary10,
                      radius: 20,
                      child: IconButton(
                        onPressed: onTap,
                        icon: const Icon(
                          Icons.delete,
                          size: 25,
                          color: Colors.red,
                        ),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
