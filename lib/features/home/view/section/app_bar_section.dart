import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/auth/bloc/user/user_bloc.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';

AppBar appbar() {
  return AppBar(
    backgroundColor: AppColors.white,
    automaticallyImplyLeading: false,
    surfaceTintColor: AppColors.white,
    elevation: 3,
    title: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.status == GlobalStateStatus.loading) {
          return const Text('Loading..');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${state.userModel?.username}',
              style: AppText.text20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'Get your favorite food here!',
              style: AppText.text14
                  .copyWith(fontWeight: FontWeight.w700, color: AppColors.grey),
            ),
          ],
        );
      },
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_sharp,
            color: AppColors.grey,
          ))
    ],
  );
}
