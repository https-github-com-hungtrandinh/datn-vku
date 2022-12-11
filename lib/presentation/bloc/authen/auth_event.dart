import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{}

class CheckAuth extends AuthEvent{

  @override
  List<Object?> get props => [];

}
class LogOut extends AuthEvent{
  @override
  List<Object?> get props =>[];

}

