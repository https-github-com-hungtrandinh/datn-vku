import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_bloc.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_event.dart';
import 'package:clean_architecture/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture/presentation/bloc/post/post_bloc.dart';
import 'package:clean_architecture/presentation/bloc/post/post_event.dart';
import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/swiper/swiper_custom.dart';
import 'package:clean_architecture/presentation/pages/initial.dart';
import 'package:clean_architecture/presentation/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

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
            create: (context) => AuthBloc(sl(),sl())..add(CheckAuth())),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(sl())),
        BlocProvider<PostBloc>(create: (context)=>PostBloc(sl()),)
      ],
      child: ChangeNotifierProvider(
        create: (context)=> CardProvider(),
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
      ),
    );
  }
}
