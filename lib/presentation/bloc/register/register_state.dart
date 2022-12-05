import 'package:clean_architecture/data/models/account.dart';
import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, loaded, error }

class RegisterState extends Equatable {
  final String email;
  final String password;
  final String userName;
  final String phoneNumber;
  final Account? account;
  final String messages;
  final String gender;
  final RegisterStatus registerStatus;
  final bool passwordValidate;
  final bool emailValidate;
   int registerStep;

   RegisterState(
      {required this.email,
      required this.gender,
      required this.registerStep,
      required this.passwordValidate,
      required this.emailValidate,
      required this.password,
      required this.messages,
      required this.userName,
      required this.account,
      required this.phoneNumber,
      required this.registerStatus});

  factory RegisterState.initial() {
    return  RegisterState(
        account: null,
        email: '',
        gender: '',
        registerStep: 0,
        passwordValidate: false,
        emailValidate: false,
        password: '',
        userName: '',
        messages: '',
        phoneNumber: '',
        registerStatus: RegisterStatus.initial);
  }

  RegisterState copyWith(
      {String? email,
      String? password,
      String? phoneNumber,
      Account? account,
      String? userName,
      String? messages,
      bool? passwordValidate,
      bool? emailValidate,
      String? gender,
      int? registerStep,
      RegisterStatus? registerStatus}) {
    return RegisterState(
        gender: gender ?? this.gender,
        registerStep: registerStep ?? this.registerStep,
        passwordValidate: passwordValidate ?? this.passwordValidate,
        emailValidate: emailValidate ?? this.emailValidate,
        messages: messages ?? this.messages,
        account: account ?? this.account,
        email: email ?? this.email,
        password: password ?? this.password,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.userName,
        registerStatus: registerStatus ?? this.registerStatus);
  }

  @override
  List<Object?> get props => [
        email,
        password,
        userName,
        phoneNumber,
        registerStatus,
        account,
        messages,
        passwordValidate,
        emailValidate,
        gender,
        registerStep
      ];
}
