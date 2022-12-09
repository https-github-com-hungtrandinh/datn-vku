import 'package:clean_architecture/data/models/account.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, loaded, error }

class LoginState extends Equatable {
  final String password;
  final String email;
  final LoginStatus loginStatus;
  final String contentLogin;
  final Account? account;
  final bool validatePassword;
  final bool validateEmail;

  const LoginState(
      {required this.loginStatus,
      required this.validateEmail,
      required this.validatePassword,
      required this.contentLogin,
      required this.password,
      required this.email,
      this.account});

  factory LoginState.initial() {
    return const LoginState(
        validateEmail: false,
        validatePassword: false,
        loginStatus: LoginStatus.initial,
        contentLogin: '',
        password: '',
        email: '',
        account: null);
  }

  LoginState copyWith(
      {LoginStatus? loginStatus,
      String? email,
      String? contentLogin,
      String? password,
      bool? validateEmail,
      bool? validatePassword,
      Account? account}) {
    return LoginState(
        validateEmail: validateEmail ?? this.validateEmail,
        validatePassword: validatePassword ?? this.validatePassword,
        contentLogin: contentLogin ?? this.contentLogin,
        loginStatus: loginStatus ?? this.loginStatus,
        password: password ?? this.password,
        email: email ?? this.email,
        account: account ?? this.account);
  }

  @override
  List<Object?> get props => [
        password,
        email,
        loginStatus,
        account,
        contentLogin,
        validateEmail,
        validatePassword
      ];
}
