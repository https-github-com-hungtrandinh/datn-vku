import 'package:clean_architecture/presentation/bloc/authen/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../../domain/usecases/social_usecase.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreference preference;
  final SocialUseCase socialUseCase;

  AuthBloc(this.preference, this.socialUseCase) : super(AuthState.initial()) {
    on<CheckAuth>(_checkAuth);
    on<LogOut>(logout);
  }

  Future<void> _checkAuth(CheckAuth event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    if (await socialUseCase.sharedPreference.get(SharedPreference.uidAccount) !=
        null) {
      emit(
        state.copyWith(authStatus: AuthStatus.auth),
      );
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unAuth));
    }
  }

  Future<void> logout(LogOut event, Emitter<AuthState> emit) async {
    await socialUseCase.sharedPreference.remove(SharedPreference.uidAccount);
  }
}
