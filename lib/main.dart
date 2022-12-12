import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_bloc.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_event.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_bloc.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_event.dart';
import 'package:clean_architecture/presentation/bloc/home/home_bloc.dart';
import 'package:clean_architecture/presentation/bloc/home/home_event.dart';
import 'package:clean_architecture/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_event.dart';
import 'package:clean_architecture/presentation/pages/initial.dart';
import 'package:clean_architecture/presentation/pages/splash_screen.dart';
import 'package:clean_architecture/presentation/pages/wellcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/util/routing.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            create: (context) => AuthBloc(sl(), sl())..add(CheckAuth())),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(sl())),
        BlocProvider<RegisterSelectionBloc>(
          create: (context) => RegisterSelectionBloc(sl())
            ..add(GetInterestEvent())
            ..add(GetMajor())
            ..add(GetPersonality()),
        ),
        BlocProvider<HomeBloc>(create: (context)=>HomeBloc(sl())..add(GetAllUser())),
        BlocProvider<ChatBloc>(create: (context) => ChatBloc(sl()))
      ],
      child: MaterialApp(
          theme: ThemeData.dark(),
          localizationsDelegates: const [
            S.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const SplashScreen(),
          supportedLocales: S.delegate.supportedLocales),
    );
  }
}
