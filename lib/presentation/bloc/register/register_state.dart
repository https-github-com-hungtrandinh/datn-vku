import 'package:clean_architecture/data/models/account.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/major.dart';

enum RegisterStatus { initial, loading, loaded, error }

class RegisterState extends Equatable {
  final String email;
  final String password;
  final String userName;
  final String phoneNumber;
  final Account? account;
  final String messages;
  final String gender;
  final String major;
  final RegisterStatus registerStatus;
  final bool passwordValidate;
  final bool emailValidate;
  final String searchMajor;
  final String birthDay;
  List<Major> listMajor;
  List<Major> listMajorInSearch;
  int registerStep;

  RegisterState(
      {required this.email,
      required this.gender,
      required this.listMajor,
      required this.major,
      required this.birthDay,
      required this.listMajorInSearch,
      required this.searchMajor,
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
    return RegisterState(
        major: '',
        birthDay: '',
        listMajor: const [],
        account: null,
        listMajorInSearch: const [],
        searchMajor: '',
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
      String? birthDay,
      String? userName,
      String? messages,
      bool? passwordValidate,
      bool? emailValidate,
      String? gender,
      int? registerStep,
      List<Major>? listMajor,
      String? searchMajor,
      String? major,
      List<Major>? listMajorInSearch,
      RegisterStatus? registerStatus}) {
    return RegisterState(
        birthDay: birthDay ?? this.birthDay,
        searchMajor: searchMajor ?? this.searchMajor,
        gender: gender ?? this.gender,
        listMajor: listMajor ?? this.listMajor,
        registerStep: registerStep ?? this.registerStep,
        passwordValidate: passwordValidate ?? this.passwordValidate,
        emailValidate: emailValidate ?? this.emailValidate,
        messages: messages ?? this.messages,
        account: account ?? this.account,
        email: email ?? this.email,
        password: password ?? this.password,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.userName,
        listMajorInSearch: listMajorInSearch ?? this.listMajorInSearch,
        registerStatus: registerStatus ?? this.registerStatus,
        major: major ?? this.major);
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
        registerStep,
        listMajor,
        searchMajor,
        listMajorInSearch,
        major,
        birthDay
      ];
}
