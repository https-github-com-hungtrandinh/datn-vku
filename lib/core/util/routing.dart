import 'package:clean_architecture/presentation/pages/forgot_password/forgot_password_screen.dart';
import 'package:clean_architecture/presentation/pages/login/login_page.dart';
import 'package:clean_architecture/presentation/pages/register/register_screen.dart';
import 'package:clean_architecture/presentation/start_selection/start_selection.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/SecondScreen':
        return MaterialPageRoute(builder: (_) => const StartSelection());
      case '/RegisterPage':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/ForgotPasswordPage':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
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
