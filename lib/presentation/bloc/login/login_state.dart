import 'package:clean_architecture/data/models/account.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user.dart';

enum LoginStatus { initial, loading, loaded, error }

class LoginState extends Equatable {
  final String password;
  final String email;
  final LoginStatus loginStatus;
  final String contentLogin;
  final Account? account;

  const LoginState(
      {required this.loginStatus,
      required this.contentLogin,
      required this.password,
      required this.email,
      this.account});

  factory LoginState.initial() {
    return const LoginState(
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
      Account? account}) {
    return LoginState(
      contentLogin: contentLogin ?? this.contentLogin,
        loginStatus: loginStatus ?? this.loginStatus,
        password: password ?? this.password,
        email: email ?? this.email,
        account: account ?? this.account);
  }

  @override
  List<Object?> get props => [password, email, loginStatus, account,contentLogin];
}
