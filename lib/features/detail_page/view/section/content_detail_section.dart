import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../models/detail_resto_model.dart';

class ContentDetailSection extends StatelessWidget {
  const ContentDetailSection({super.key, this.data});

  final Restaurant? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.name ?? '',
                      style: AppText.text20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${data?.address}, ${data?.city}',
                      style: AppText.text16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    data?.rating.toString() ?? '',
                    style: AppText.text20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Description',
            style: AppText.text18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data?.description ?? '',
            style: AppText.text14,
            maxLines: 5,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
