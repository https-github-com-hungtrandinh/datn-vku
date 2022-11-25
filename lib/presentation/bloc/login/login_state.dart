import 'package:equatable/equatable.dart';

import '../../../data/models/user.dart';

enum LoginStatus { initial, loading, loaded, error }

class LoginState extends Equatable {
  final String password;
  final String email;
  final LoginStatus loginStatus;
  final User? user;

  const LoginState(
      {required this.loginStatus, required this.password, required this.email,this.user});

  factory LoginState.initial() {
    return const LoginState(
        loginStatus: LoginStatus.initial, password: '', email: '',user: null);
  }

  LoginState copyWith(
      {LoginStatus? loginStatus, String? email, String? password,User? user}) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      password: password ?? this.password,
      email: email ?? this.email,
      user: user ?? this.user
    );
  }

  @override
  List<Object?> get props => [password, email, loginStatus,user];
}
