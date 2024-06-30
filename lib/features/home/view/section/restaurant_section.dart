import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/home/bloc/home_bloc.dart';
import 'package:madang/widgets/loading/loading_widget.dart';
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
          return const LoadingWidget();
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
    return ListView.builder(
      itemCount: data!.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              RoutesName.detailPage,
              arguments: data[index].id,
            );
          },
          child: RestoCard(
            data: data[index],
          ),
        );
      },
    );
  }
}
