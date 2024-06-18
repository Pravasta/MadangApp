import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/features/auth/bloc/user/user_bloc.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../constant/url_assets.dart';

class HeaderProfile {
  static PreferredSize appbar(BuildContext context) {
    final data = context.read<UserBloc>().state.userModel;
    return PreferredSize(
      preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 2 / 11),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            surfaceTintColor: AppColors.white,
            backgroundColor: AppColors.white,
            title: Text(
              'Profile',
              style: AppText.text20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                data?.photoUrl == null
                    ? Image.asset(UrlAssets.profile, width: 80)
                    : Image.network(data!.photoUrl!, width: 80),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data?.username}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${data?.email}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
