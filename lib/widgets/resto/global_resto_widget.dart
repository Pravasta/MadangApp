import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_text.dart';
import '../../constant/url_assets.dart';

class GlobalRestoWidget extends StatelessWidget {
  const GlobalRestoWidget({super.key, required this.data});

  final Map<String, dynamic> data;

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
                  child: Image.asset(
                    UrlAssets.resto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['title'],
                              style: AppText.text18
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Text(data['city'],
                              style: AppText.text14.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.grey)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                          ],
                        ),
                        Text(
                          ' Rp. ${data['price']}',
                          style: AppText.text16.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            top: 4,
            right: 4,
            child: CircleAvatar(
              backgroundColor: AppColors.secondary10,
              radius: 20,
              child: Icon(
                Icons.favorite,
                size: 25,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
