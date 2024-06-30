import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/constant/url_assets.dart';
import 'package:madang/features/auth/bloc/auth/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        final navigator = Navigator.of(context);

        if (state.status == GlobalStateStatus.succes) {
          await Future.delayed(const Duration(seconds: 3));
          navigator.pushReplacementNamed(RoutesName.mainNavigation);
        }

        if (state.status == GlobalStateStatus.error) {
          await Future.delayed(const Duration(seconds: 3));
          navigator.pushReplacementNamed(RoutesName.onBoard);
        }
      },
      child: content(),
    );
  }

  Scaffold content() {
    return Scaffold(
        backgroundColor: AppColors.primaryMain,
        body: Stack(children: [
          Center(
              child: Text('Madang',
                  style: AppText.text26.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 40,
                      letterSpacing: 3))),
          Positioned(
              top: 0, left: 0, child: Image.asset(UrlAssets.splash, scale: 4)),
          Positioned(
              bottom: 100,
              right: 0,
              child: Image.asset(UrlAssets.vector, scale: 4))
        ]));
  }
}
