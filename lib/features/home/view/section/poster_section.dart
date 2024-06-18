import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/url_assets.dart';

class PosterSection extends StatefulWidget {
  const PosterSection({super.key});

  @override
  State<PosterSection> createState() => _PosterSectionState();
}

class _PosterSectionState extends State<PosterSection> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      UrlAssets.poster1,
      UrlAssets.poster,
      UrlAssets.poster2,
      UrlAssets.poster3,
      UrlAssets.poster4,
    ];

    return Column(
      children: [
        CarouselSlider(
          items: imageList.map((e) {
            return Container(
              margin: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  e,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              enlargeFactor: 0.1,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((e) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(e.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == e.key
                      ? AppColors.primaryMain
                      : AppColors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
