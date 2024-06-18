import 'package:flutter/material.dart';
import 'package:madang/features/favorite/view/favorite_page.dart';
import 'package:madang/features/home/view/home_page.dart';
import 'package:madang/features/profile/view/profile_page.dart';
import 'package:madang/features/search/view/search_page.dart';

class MainNavigationModel {
  static final List<Map<String, dynamic>> _listBottomNavbar = [
    {
      'title': 'Home',
      'icon': Icons.home,
      'widget': const HomePage(),
    },
    {
      'title': 'Search',
      'icon': Icons.search,
      'widget': const SearchPage(),
    },
    {
      'title': 'Favorite',
      'icon': Icons.bookmark,
      'widget': const FavoritePage(),
    },
    {
      'title': 'Profile',
      'icon': Icons.person,
      'widget': const ProfilePage(),
    }
  ];

  static List<Map<String, dynamic>> get listBottomNavbar => _listBottomNavbar;
}
