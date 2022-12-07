import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class ChangedEmailRegister extends RegisterEvent {
  final String email;

  ChangedEmailRegister(this.email);

  @override
  List<Object?> get props => [email];
}

class ChangedPasswordRegister extends RegisterEvent {
  final String password;

  ChangedPasswordRegister(this.password);

  @override
  List<Object?> get props => [password];
}

class ChangedPhoneNumberRegister extends RegisterEvent {
  final String numberPhone;

  ChangedPhoneNumberRegister(this.numberPhone);

  @override
  List<Object?> get props => [numberPhone];
}

class RegisterSummit extends RegisterEvent {
  @override
  List<Object?> get props => [];
}















