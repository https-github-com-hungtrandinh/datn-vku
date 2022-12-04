import 'package:clean_architecture/presentation/bloc/authen/auth_bloc.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_state.dart';
import 'package:clean_architecture/presentation/pages/initial.dart';
import 'package:clean_architecture/presentation/pages/wellcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/value/image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.auth) {
            Navigator.pushNamed(context, InitialApp.initialAppPushName);
          } else if (state.authStatus == AuthStatus.unAuth) {
            Navigator.pushNamed(context, WelcomePage.routeName);
          }
        },
        child: Stack(
          children: [
            Image.asset(
              ImageSrc.imageBackgroundSelection,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
