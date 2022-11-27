import 'package:clean_architecture/presentation/bloc/register/register_event.dart';
import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../../domain/usecases/social_usecase.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SocialUseCase socialUseCase;

  RegisterBloc(this.socialUseCase) : super(RegisterState.initial()) {
    on<ChangedEmailRegister>(_changedEmail);
    on<ChangedPasswordRegister>(_changedPassword);
    on<ChangedNameUserRegister>(_changedUserName);
    on<ChangedPhoneNumberRegister>(_changedPhoneNumber);
  }

  void _changedEmail(ChangedEmailRegister event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(email: event.email),
    );
  }

  void _changedPassword(
      ChangedPasswordRegister event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(password: event.password),
    );
  }

  void _changedUserName(
      ChangedNameUserRegister event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(password: event.nameUser),
    );
  }

  void _changedPhoneNumber(
      ChangedPhoneNumberRegister event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(password: event.numberPhone),
    );
  }

  Future<void> registerSummit(
      RegisterSummit event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(registerStatus: RegisterStatus.loading),
    );
    final result = await socialUseCase.register(
      email: state.email!,
      password: state.password!,
      userName: state.userName!,
      phoneNumber: state.phoneNumber!,
    );
    result.fold((error) {
      emit(
        state.copyWith(
          registerStatus: RegisterStatus.error,
        ),
      );
    }, (data) {
      socialUseCase.sharedPreference
          .set(SharedPreference.tokensAccess, data.tokens.access.token);
      socialUseCase.sharedPreference
          .set(SharedPreference.tokenRefresh, data.tokens.refresh.token);
      emit(
          state.copyWith(registerStatus: RegisterStatus.loaded, account: data));
    });
  }
}
