import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_bloc.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_event.dart';
import 'package:clean_architecture/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture/presentation/pages/splash.dart';
import 'package:clean_architecture/presentation/start_selection/start_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/util/routing.dart';
import 'generated/l10n.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(sl())),
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(sl())..add(CheckAuth())),
      ],
      child: MaterialApp(
          theme: ThemeData.dark(),
          localizationsDelegates: const [
            S.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const SplashScreen(),
          supportedLocales: S.delegate.supportedLocales),
    );
  }
}
