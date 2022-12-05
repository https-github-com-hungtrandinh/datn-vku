import 'package:clean_architecture/core/util/validate.dart';
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
    emit(state.copyWith(
        email: event.email, validateEmail: event.email.isValidEmail()));
  }

  void _onChangedPassword(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        password: event.password,
        validatePassword: event.password.isValidatePassword()));
  }

  Future<void> login(LoginSummit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final result = await socialUseCase.loginWithEmailPassword(
        email: state.email, password: state.password);
    result.fold((fail) {
      emit(
        state.copyWith(
            loginStatus: LoginStatus.error, contentLogin: fail.messenger),
      );
    }, (data) {
      emit(state.copyWith(loginStatus: LoginStatus.loaded));
    });
  }
}
