import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/features/auth/bloc/auth/auth_bloc.dart';
import 'package:madang/features/profile/models/profile_list_model.dart';
import 'package:madang/features/profile/view/section/header.dart';
import 'widget/profile_list_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderProfile.appbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: AppText.text14.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: ProfileListModel.account.map((e) {
                  return ProfileListWidget(data: e);
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                'Account',
                style: AppText.text14.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: ProfileListModel.moreInfo.map((e) {
                  return ProfileListWidget(data: e);
                }).toList(),
              ),
              const SizedBox(height: 10),
              buttonLogOut(context),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Align buttonLogOut(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(UnAuthenticated());
            Navigator.of(context)
                .pushNamedAndRemoveUntil(RoutesName.onBoard, (route) => false);
          },
          child: Text('Logout',
              style: AppText.text14.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.accent70,
              ))),
    );
  }
}
