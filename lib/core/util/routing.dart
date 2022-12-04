import 'package:clean_architecture/presentation/pages/home_screen.dart';
import 'package:clean_architecture/presentation/pages/initial.dart';
import 'package:clean_architecture/presentation/pages/login_screen.dart';
import 'package:clean_architecture/presentation/pages/register_screen.dart';
import 'package:clean_architecture/presentation/pages/wellcome_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/forgot_password_screen.dart';

import '../../presentation/pages/login_screen.dart';
import '../../presentation/pages/register_screen.dart';
import '../../presentation/pages/register_slection/register_selection.dart';
import '../../presentation/pages/start_selection_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/StartSelection':
        return MaterialPageRoute(builder: (_) => const StartSelection());
      case '/RegisterPage':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/ForgotPasswordPage':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/HomePage':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/InitialScreen':
        return MaterialPageRoute(builder: (_) => const InitialApp());
      case '/RegisterStepTwoPage':
        return MaterialPageRoute(builder: (_) => const RegisterSelection());
      case '/welcome-page':
        return MaterialPageRoute(builder: (_) => const WelcomePage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
