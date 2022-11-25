import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}
class LoginSummit extends LoginEvent{

  @override
  List<Object?> get props =>[];
}
