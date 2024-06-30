import 'core/core.dart';
import 'package:http/http.dart' as http;

class MainBloc {
  static final _providers = [
    RepositoryProvider(create: (_) => FirebaseAuth.instance),
    RepositoryProvider(create: (_) => FirebaseFirestore.instance),
    RepositoryProvider(create: (_) => http.Client()),
    RepositoryProvider(
        create: (_) => AppEndPoint('restaurant-api.dicoding.dev')),
    RepositoryProvider(
      create: (context) =>
          PreferencesHelper(sharedPreferences: SharedPreferences.getInstance()),
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
            client: context.read<http.Client>(),
            appEndPoint: context.read<AppEndPoint>())),
    RepositoryProvider(create: (_) => DatabaseHelper()),
    RepositoryProvider<HomeRepository>(
        create: (context) =>
            HomeRepositoryImpl(service: context.read<RestaurantApiService>())),
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
        create: (context) => CredentialBloc(context.read<FirebaseAuthRepo>())),
    BlocProvider(
        create: (context) =>
            AuthBloc(context.read<FirebaseAuthRepo>())..add(Authenticated())),
    BlocProvider(
        create: (context) => UserBloc(context.read<FirebaseAuthRepo>())),
    BlocProvider(create: (context) => HomeBloc(context.read<HomeRepository>())),
    BlocProvider<DetailRestoBloc>(
        create: (context) =>
            DetailRestoBloc(context.read<DetailRestoRepository>())),
    BlocProvider(
        create: (context) => SearchBloc(context.read<SearchRepository>())),
    BlocProvider(
        create: (context) => FavoriteBloc(context.read<FavoriteRepository>())),
    BlocProvider(create: (context) => SchedulingCubit()),
    BlocProvider(
      create: (context) => PreferencesCubit(
        context.read<PreferencesHelper>(),
      ),
    )
  ];

  static get providers => _providers;
}
