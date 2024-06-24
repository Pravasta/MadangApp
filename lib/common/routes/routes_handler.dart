import 'package:flutter/material.dart';
import 'package:madang/features/auth/view/login_page.dart';
import 'package:madang/features/auth/view/register_page.dart';
import 'package:madang/features/detail_page/view/detail_page.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:madang/features/main_navigation/view/main_navigation_page.dart';
import 'package:madang/features/onboarding/view/onboarding_page.dart';
import 'package:madang/features/splashscreen/view/splash_page.dart';

import '../../constant/app_text.dart';
import 'routes_name.dart';

class RoutesHandler {
  static String initialRoutes = RoutesName.initial;
  static const initialNavbarVisibility = true;

  static MaterialPageRoute get _emptyPage {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text('404 not found',
                style: AppText.text24.copyWith(
                  fontWeight: FontWeight.bold,
                )),
          ),
        );
      },
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case RoutesName.onBoard:
        return MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
          settings: settings,
        );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
          settings: settings,
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
          settings: settings,
        );
      case RoutesName.mainNavigation:
        return MaterialPageRoute(
          builder: (context) => const MainNavigationPage(),
          settings: settings,
        );
      case RoutesName.detailPage:
        final data = settings.arguments;
        if (data == null || data is! Restaurants) return _emptyPage;
        return MaterialPageRoute(
          builder: (context) => DetailPage(restaurants: data),
          settings: settings,
        );
      default:
        return _emptyPage;
    }
  }
}
