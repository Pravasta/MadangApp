import 'package:flutter/material.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/features/main_navigation/models/main_navigation_model.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _listWidget = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < MainNavigationModel.listBottomNavbar.length; i++) {
      final data = MainNavigationModel.listBottomNavbar[i]['widget'];
      _listWidget.add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: AppText.text14.copyWith(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: AppText.text14.copyWith(
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: AppColors.primaryMain,
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.grey,
          elevation: 0,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {});
          },
          items: MainNavigationModel.listBottomNavbar.map((e) {
            return BottomNavigationBarItem(
              activeIcon: Icon(e['icon'], color: AppColors.primaryMain),
              icon: Icon(e['icon'], color: AppColors.grey),
              label: e['title'],
            );
          }).toList()),
    );
  }
}
