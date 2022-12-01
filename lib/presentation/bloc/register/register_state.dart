import 'package:clean_architecture/data/models/account.dart';
import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, loaded, error }

class RegisterState extends Equatable {
  final String? email;
  final String? password;
  final String? userName;
  final String? phoneNumber;
  final Account? account;
  final String? messages;
  final RegisterStatus registerStatus;

  const RegisterState(
      {required this.email,
      required this.password,
      required this.messages,
      required this.userName,
      required this.account,
      required this.phoneNumber,
      required this.registerStatus});

  factory RegisterState.initial() {
    return const RegisterState(
        account: null,
        email: null,
        password: null,
        userName: null,
        messages: null,
        phoneNumber: null,
        registerStatus: RegisterStatus.initial);
  }

  RegisterState copyWith(
      {String? email,
      String? password,
      String? phoneNumber,
      Account? account,
      String? userName,
      String? messages,
      RegisterStatus? registerStatus}) {
    return RegisterState(
        messages: messages ?? this.messages,
        account: account ?? this.account,
        email: email ?? this.email,
        password: password ?? this.password,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.userName,
        registerStatus: registerStatus ?? this.registerStatus);
  }

  @override
  List<Object?> get props =>
      [email, password, userName, phoneNumber, registerStatus, account,messages];
}
