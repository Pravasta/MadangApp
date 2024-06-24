import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/home/bloc/home_bloc.dart';
import '../../models/restaurant_api.dart';
import '../widget/resto_card.dart';

class RestaurantSection extends StatefulWidget {
  const RestaurantSection({super.key});

  @override
  State<RestaurantSection> createState() => _RestaurantSectionState();
}

class _RestaurantSectionState extends State<RestaurantSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(OnGetAllRestaurantEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final data = state.data;

        if (state.status == HomeStatusState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == HomeStatusState.error) {
          return Center(child: Text(state.message));
        }
        if (state.status == HomeStatusState.noData) {
          return Center(child: Text(state.message));
        }
        if (state.status == HomeStatusState.hasData) {
          return content(data);
        }
        return const SizedBox();
      },
    );
  }

  Widget content(List<Restaurants>? data) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Restaurant',
              style: AppText.text18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data!.map((e) {
                int index = data.indexOf(e);

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RoutesName.detailPage, arguments: e);
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: index == data.length - 1 ? 15 : 0),
                      child: RestoCard(data: e)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
