import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/features/favorite/bloc/favorite_bloc.dart';

import '../../../../widgets/resto/global_resto_widget.dart';
import '../../../home/models/restaurant_api.dart';

class FavoriteDoneWidget extends StatelessWidget {
  const FavoriteDoneWidget({super.key, this.data});

  final List<Restaurants>? data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: data!.map((e) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutesName.detailPage,
                  arguments: e.id,
                );
              },
              child: GlobalRestoWidget(
                imageUrl: e.pictureId,
                name: e.name,
                city: e.city,
                rating: e.rating,
                isFavorite: true,
                onTap: () {
                  context.read<FavoriteBloc>().add(OnRemoveFavorite(id: e.id));
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
