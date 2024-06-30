import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:madang/constant/url_assets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        UrlAssets.loading,
        width: 200,
        height: 200,
      ),
    );
  }
}
