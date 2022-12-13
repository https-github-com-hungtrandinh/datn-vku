
import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, loaded, error }

class RegisterState extends Equatable {
  final String email;
  final String password;
  final String phoneNumber;
  final String messages;
  final RegisterStatus registerStatus;
  final bool passwordValidate;
  final bool emailValidate;

  RegisterState(
      {required this.email,
      required this.passwordValidate,
      required this.emailValidate,
      required this.password,
      required this.messages,
      required this.phoneNumber,
      required this.registerStatus});

  factory RegisterState.initial() {
    return RegisterState(
        email: '',
        passwordValidate: false,
        emailValidate: false,
        password: '',
        messages: '',
        phoneNumber: '',
        registerStatus: RegisterStatus.initial);
  }

  RegisterState copyWith(
      {String? email,
      String? password,
      String? phoneNumber,
      String? messages,
      bool? passwordValidate,
      bool? emailValidate,
      RegisterStatus? registerStatus}) {
    return RegisterState(
      passwordValidate: passwordValidate ?? this.passwordValidate,
      emailValidate: emailValidate ?? this.emailValidate,
      messages: messages ?? this.messages,
      email: email ?? this.email,
      password: password ?? this.password,
      registerStatus: registerStatus ?? this.registerStatus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        phoneNumber,
        registerStatus,
        messages,
        passwordValidate,
        emailValidate,
      ];
}
