import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/favorite/bloc/favorite_bloc.dart';
import 'package:madang/features/favorite/view/widget/favorite_done_widget.dart';
import 'package:madang/features/favorite/view/widget/initial_widget.dart';
import 'package:madang/widgets/loading/loading_widget.dart';
import '../../../constant/app_text.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(OnGetAllFavorite());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite',
          style: AppText.text20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final data = state.data;
        if (state.status == FavoriteStatusState.initial) {
          return const FavoriteInitialWidget();
        }
        if (state.status == FavoriteStatusState.loading) {
          return const LoadingWidget();
        }
        if (state.status == FavoriteStatusState.error) {
          return Center(child: Text(state.message));
        }
        if (state.status == FavoriteStatusState.hasData) {
          return FavoriteDoneWidget(data: data);
        }
        return const SizedBox();
      },
    );
  }
}
