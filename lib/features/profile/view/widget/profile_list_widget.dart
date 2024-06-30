import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/controller/preferences/preferences_cubit.dart';
import 'package:madang/controller/scheduling/scheduling_cubit.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Icon(
          data['icon'],
          size: 25,
          color: AppColors.secondaryMain,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.1,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['label'],
                      style: AppText.text14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    data['label'] == 'Notification'
                        ? adaptiveSchedule()
                        : data['label'] == 'Change Theme'
                            ? adaptiveTheme()
                            : const Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                              ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget adaptiveTheme() {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        return Switch.adaptive(
          value: state.themeState,
          activeColor: AppColors.primaryMain,
          activeTrackColor: AppColors.secondary90,
          inactiveTrackColor: AppColors.secondary10,
          inactiveThumbColor: AppColors.black,
          onChanged: (value) async {
            context.read<PreferencesCubit>().enabledDarkTheme(value);
          },
        );
      },
    );
  }

  Widget adaptiveSchedule() {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        return Switch.adaptive(
          value: state.dailyState,
          activeColor: AppColors.primaryMain,
          activeTrackColor: AppColors.secondary90,
          inactiveTrackColor: AppColors.secondary10,
          inactiveThumbColor: AppColors.black,
          onChanged: (value) async {
            context.read<SchedulingCubit>().scheduledResto(value);
            context.read<PreferencesCubit>().enabledDailyResto(value);
          },
        );
      },
    );
  }
}
