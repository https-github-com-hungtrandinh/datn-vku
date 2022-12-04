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
  }

  Future<void> _checkAuth(CheckAuth event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    if (await socialUseCase.checkAuth()) {
      emit(
        state.copyWith(authStatus: AuthStatus.auth),
      );
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unAuth));
    }
  }
}
