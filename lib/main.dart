import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/common/routes/routes_handler.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/features/auth/bloc/user/user_bloc.dart';
import 'package:madang/features/auth/repository/firebase_auth_repo.dart';
import 'package:madang/firebase_options.dart';
import 'package:madang/service/firebase/firebase_auth_service.dart';

import 'features/auth/bloc/auth/auth_bloc.dart';
import 'features/auth/bloc/credential/credential_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
            create: (context) => FirebaseAuthService(
                auth: context.read<FirebaseAuth>(),
                firestore: context.read<FirebaseFirestore>())),
        RepositoryProvider<FirebaseAuthRepo>(
          create: (context) => FirebaseAuthRepoImpl(
            authService: context.read<FirebaseAuthService>(),
          ),
        ),
        BlocProvider<CredentialBloc>(
          create: (context) => CredentialBloc(
            context.read<FirebaseAuthRepo>(),
          ),
        ),
        BlocProvider(
            create: (context) => AuthBloc(
                  context.read<FirebaseAuthRepo>(),
                )..add(Authenticated())),
        BlocProvider(
            create: (context) => UserBloc(
                  context.read<FirebaseAuthRepo>(),
                )),
      ],
      child: MaterialApp(
        title: 'Madang',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.initial,
        onGenerateRoute: RoutesHandler.onGenerateRoute,
      ),
    );
  }
}
