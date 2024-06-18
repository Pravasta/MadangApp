import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/constant/url_assets.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(15),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title'],
                      style: AppText.text16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp ${data['price']}',
                      style: AppText.text14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.grey,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
