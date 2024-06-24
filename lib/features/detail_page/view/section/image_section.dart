import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 2 / 6,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 2 / 6,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.transparent,
                AppColors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
