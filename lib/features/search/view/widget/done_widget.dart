import 'package:flutter/material.dart';
import 'package:madang/common/routes/routes_name.dart';

import '../../../../widgets/resto/global_resto_widget.dart';
import '../../models/search_restaurant_response.dart';

Widget done(BuildContext context, List<RestaurantSearch>? data) {
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
            ),
          );
        }).toList(),
      ),
    ),
  );
}
