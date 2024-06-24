import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:madang/common/endpoint/app_endpoint.dart';
import 'package:madang/common/navigation/navigation.dart';
import 'package:madang/common/routes/routes_handler.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/constant/app_theme.dart';
import 'package:madang/controller/preferences/cubit/preferences_cubit.dart';
import 'package:madang/controller/scheduling/cubit/scheduling_cubit.dart';
import 'package:madang/features/auth/bloc/user/user_bloc.dart';
import 'package:madang/features/auth/repository/firebase_auth_repo.dart';
import 'package:madang/features/detail_page/repository/detail_resto_repository.dart';
import 'package:madang/features/favorite/bloc/favorite_bloc.dart';
import 'package:madang/features/favorite/repository/favorite_repository.dart';
import 'package:madang/features/home/bloc/home_bloc.dart';
import 'package:madang/features/home/repository/home_repository.dart';
import 'package:madang/features/search/bloc/search_bloc.dart';
import 'package:madang/firebase_options.dart';
import 'package:madang/service/api/restaurant_api_service.dart';
import 'package:madang/service/firebase/firebase_auth_service.dart';
import 'package:madang/utils/db/database_helper.dart';
import 'package:madang/utils/preferences/preferences_helper.dart';
import 'package:madang/utils/schedulling/background_service.dart';
import 'package:madang/utils/schedulling/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/bloc/auth/auth_bloc.dart';
import 'features/auth/bloc/credential/credential_bloc.dart';
import 'features/detail_page/bloc/detail_resto_bloc.dart';
import 'features/search/repository/search_repository.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final NotificationHelper _notification = NotificationHelper();
  final BackgroundService _backgroundService = BackgroundService();

  _backgroundService.initializeIsolate();

  if (Platform.isAndroid) {
    print('coba');
    await AndroidAlarmManager.initialize();
  }

  await _notification.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          RepositoryProvider(create: (_) => FirebaseAuth.instance),
          RepositoryProvider(create: (_) => FirebaseFirestore.instance),
          RepositoryProvider(
              create: (_) => AppEndPoint('restaurant-api.dicoding.dev')),
          RepositoryProvider(
            create: (context) => PreferencesHelper(
                sharedPreferences: SharedPreferences.getInstance()),
          ),
          RepositoryProvider(
              create: (context) => FirebaseAuthService(
                  auth: context.read<FirebaseAuth>(),
                  firestore: context.read<FirebaseFirestore>())),
          RepositoryProvider<FirebaseAuthRepo>(
              create: (context) => FirebaseAuthRepoImpl(
                  authService: context.read<FirebaseAuthService>())),
          RepositoryProvider(
              create: (context) => RestaurantApiService(
                  appEndPoint: context.read<AppEndPoint>())),
          RepositoryProvider(create: (_) => DatabaseHelper()),
          RepositoryProvider<HomeRepository>(
              create: (context) => HomeRepositoryImpl(
                  service: context.read<RestaurantApiService>())),
          RepositoryProvider<DetailRestoRepository>(
              create: (context) => DetailRestoRepositoryImpl(
                  service: context.read<RestaurantApiService>(),
                  authService: context.read<FirebaseAuthService>())),
          RepositoryProvider<SearchRepository>(
              create: (context) => SearchRepositoryImpl(
                  service: context.read<RestaurantApiService>())),
          RepositoryProvider<FavoriteRepository>(
              create: (context) => FavoriteRepositoryImpl(
                  databaseHelper: context.read<DatabaseHelper>())),
          BlocProvider<CredentialBloc>(
              create: (context) =>
                  CredentialBloc(context.read<FirebaseAuthRepo>())),
          BlocProvider(
              create: (context) => AuthBloc(context.read<FirebaseAuthRepo>())
                ..add(Authenticated())),
          BlocProvider(
              create: (context) => UserBloc(context.read<FirebaseAuthRepo>())),
          BlocProvider(
              create: (context) => HomeBloc(context.read<HomeRepository>())),
          BlocProvider<DetailRestoBloc>(
              create: (context) =>
                  DetailRestoBloc(context.read<DetailRestoRepository>())),
          BlocProvider(
              create: (context) =>
                  SearchBloc(context.read<SearchRepository>())),
          BlocProvider(
              create: (context) =>
                  FavoriteBloc(context.read<FavoriteRepository>())),
          BlocProvider(create: (context) => SchedulingCubit()),
          BlocProvider(
            create: (context) => PreferencesCubit(
              context.read<PreferencesHelper>(),
            ),
          )
        ],
        child: BlocBuilder<PreferencesCubit, PreferencesState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Madang',
              theme: state.themeState == false
                  ? AppTheme.lightTheme
                  : AppTheme.darkTheme,
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.initial,
              onGenerateRoute: RoutesHandler.onGenerateRoute,
            );
          },
        ));
  }
}
