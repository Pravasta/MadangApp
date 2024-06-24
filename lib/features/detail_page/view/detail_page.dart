import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/app_url.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/detail_page/bloc/detail_resto_bloc.dart';
import 'package:madang/features/detail_page/view/section/appbar_section.dart';
import 'package:madang/features/detail_page/view/section/menu_detail_section.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import '../models/detail_resto_model.dart';
import 'section/content_detail_section.dart';
import 'section/image_section.dart';
import 'section/review_section.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.restaurants});
  final Restaurants restaurants;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<DetailRestoBloc>()
        .add(OnGetDetailRestoEvent(id: widget.restaurants.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailRestoBloc, DetailRestoState>(
        builder: (context, state) {
          final data = state.data;
          if (state.status == DetailStatusState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == DetailStatusState.error) {
            return Center(child: Text(state.message));
          }
          if (state.status == DetailStatusState.hasData) {
            return content(data);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget content(Restaurant? data) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSection(imageUrl: '${AppUrl.restoImage}/${data?.pictureId}'),
              ContentDetailSection(data: data),
              MenuDetailSection(data: data),
              ReviewSection(data: data),
            ],
          ),
          AppbarSection(data: data),
        ],
      ),
    );
  }
}
