import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/features/auth/bloc/user/user_bloc.dart';
import 'package:madang/features/home/view/section/menu_section.dart';
import 'section/app_bar_section.dart';
import 'section/poster_section.dart';
import 'section/restaurant_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(OnGetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appbar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              PosterSection(),
              MenuSection(),
              RestaurantSection(),
            ],
          ),
        ),
      ),
    );
  }
}
