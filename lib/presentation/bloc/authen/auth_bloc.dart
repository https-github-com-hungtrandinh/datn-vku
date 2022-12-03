import 'package:clean_architecture/presentation/bloc/authen/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/datalocal/shared_preferences_data.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreference preference;

  AuthBloc(this.preference) : super(AuthState.initial()) {
    on<CheckAuth>(_checkAuth);
  }

  Future<void> _checkAuth(CheckAuth event, Emitter<AuthState> emit) async {
    final String? token = await preference.get(SharedPreference.tokensAccess);
     await Future.delayed(const Duration(seconds: 3));
    if (token == null) {
      emit(
        state.copyWith(authStatus: AuthStatus.unAuth),
      );
    } else{
      emit(state.copyWith(authStatus: AuthStatus.auth));
    }
  }
}
