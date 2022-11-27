import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:clean_architecture/presentation/bloc/login/login_event.dart';
import 'package:clean_architecture/presentation/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/social_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SocialUseCase socialUseCase;

  LoginBloc(this.socialUseCase) : super(LoginState.initial()) {
    on<EmailChanged>(_onChangedEmail);
    on<PasswordChanged>(_onChangedPassword);
    on<LoginSummit>(login);
  }

  void _onChangedEmail(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onChangedPassword(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> login(LoginSummit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final result =
        await socialUseCase.login(email: state.email, password: state.password);
    result.fold((fail) {
      emit(
        state.copyWith(
            loginStatus: LoginStatus.error, contentLogin: fail.message),
      );
    }, (data) {
      socialUseCase.sharedPreference
          .set(SharedPreference.tokensAccess, data.tokens.access.token);
      socialUseCase.sharedPreference
          .set(SharedPreference.tokenRefresh, data.tokens.refresh.token);
      emit(state.copyWith(account: data, loginStatus: LoginStatus.loaded));
    });
  }
}
