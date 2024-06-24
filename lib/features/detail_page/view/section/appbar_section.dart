import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/detail_page/models/detail_resto_model.dart';
import 'package:madang/features/favorite/bloc/favorite_bloc.dart';
import 'package:madang/features/home/models/restaurant_api.dart';

import '../../../../constant/app_colors.dart';

class AppbarSection extends StatelessWidget {
  const AppbarSection({super.key, required this.data});

  final Restaurant? data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: AppColors.white,
              ),
            ),
            BlocConsumer<FavoriteBloc, FavoriteState>(
              listener: (context, state) {
                if (state.status == FavoriteStatusState.hasData) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context.read<FavoriteBloc>().add(OnInserFavorite(
                          restaurants: Restaurants(
                            id: data!.id,
                            name: data!.name,
                            description: data!.description,
                            pictureId: data!.pictureId,
                            city: data!.city,
                            rating: data!.rating,
                          ),
                        ));
                  },
                  icon: const Icon(
                    Icons.bookmark_border_outlined,
                    color: AppColors.white,
                    size: 30,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
