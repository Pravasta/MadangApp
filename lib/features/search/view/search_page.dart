import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/search/bloc/search_bloc.dart';
import 'package:madang/features/search/view/widget/initial_widget.dart';
import 'package:madang/widgets/field/default_field.dart';
import 'package:madang/widgets/loading/loading_widget.dart';

import '../../../constant/app_text.dart';
import 'widget/done_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchC = TextEditingController();
  bool isSearch = false;

  @override
  void dispose() {
    super.dispose();
    searchC.dispose();
  }

  void clear() {
    searchC.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 1 / 7),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Search',
                style: AppText.text20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buttonSearch(),
          ],
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          final data = state.data;

          if (state.status == SearchStatusState.loading) {
            return const LoadingWidget();
          }
          if (state.status == SearchStatusState.noData) {
            return Center(child: Text(state.message));
          }
          if (state.status == SearchStatusState.error) {
            return Center(child: Text(state.message));
          }
          if (state.status == SearchStatusState.hasData) {
            return done(context, data);
          }
          return initial();
        },
      ),
    );
  }

  Widget buttonSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DefaultField(
        hintText: 'Search food',
        suffixIcon: isSearch == false
            ? const Icon(Icons.search)
            : IconButton(
                onPressed: () {
                  clear();
                  isSearch = !isSearch;
                  setState(() {});
                },
                icon: const Icon(Icons.clear)),
        controller: searchC,
        onChanged: (value) {
          setState(() {
            isSearch = !isSearch;
          });
          context.read<SearchBloc>().add(OnGetSearchEvent(query: value));
        },
      ),
    );
  }
}
