import 'package:madang/bloc.dart';
import 'core/core.dart';

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
        providers: MainBloc.providers,
        child: BlocBuilder<PreferencesCubit, PreferencesState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Madang',
              theme: state.themeState == false
                  ? AppTheme.lightTheme
                  : AppTheme.darkTheme,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.initial,
              onGenerateRoute: RoutesHandler.onGenerateRoute,
            );
          },
        ));
  }
}
