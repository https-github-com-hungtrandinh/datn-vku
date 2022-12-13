import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, loaded, error }

class LoginState extends Equatable {
  final String password;
  final String email;
  final LoginStatus loginStatus;
  final String contentLogin;
  final bool validatePassword;
  final bool validateEmail;
  final String uid;

  const LoginState({
    required this.loginStatus,
    required this.uid,
    required this.validateEmail,
    required this.validatePassword,
    required this.contentLogin,
    required this.password,
    required this.email,
  });

  factory LoginState.initial() {
    return const LoginState(
      validateEmail: false,
      uid: '',
      validatePassword: false,
      loginStatus: LoginStatus.initial,
      contentLogin: '',
      password: '',
      email: '',
    );
  }

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? email,
    String? contentLogin,
    String? password,
    bool? validateEmail,
    bool? validatePassword,
    String? uid,
  }) {
    return LoginState(
      uid: uid ?? this.uid,
      validateEmail: validateEmail ?? this.validateEmail,
      validatePassword: validatePassword ?? this.validatePassword,
      contentLogin: contentLogin ?? this.contentLogin,
      loginStatus: loginStatus ?? this.loginStatus,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [
        password,
        email,
        loginStatus,
        contentLogin,
        validateEmail,
        uid,
        validatePassword
      ];
}
