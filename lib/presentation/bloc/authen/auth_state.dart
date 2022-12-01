import 'package:equatable/equatable.dart';

enum AuthStatus {
  initial,
  auth,
  unAuth,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;

  factory AuthState.initial() {
    return const AuthState(authStatus: AuthStatus.initial);
  }

  AuthState copyWith({AuthStatus? authStatus}) {
    return AuthState(authStatus: authStatus ?? this.authStatus);
  }

  const AuthState({required this.authStatus});

  @override
  List<Object?> get props => [authStatus];
}
