 import 'package:clean_architecture/presentation/bloc/authen/auth_state.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{}

class CheckAuth extends AuthEvent{

  @override
  List<Object?> get props => [];

}

