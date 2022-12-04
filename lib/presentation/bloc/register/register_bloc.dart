import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:clean_architecture/presentation/bloc/register/register_event.dart';
import 'package:clean_architecture/presentation/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/social_usecase.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SocialUseCase socialUseCase;

  RegisterBloc(this.socialUseCase) : super(RegisterState.initial()) {
    on<ChangedEmailRegister>(_changedEmail);
    on<ChangedPasswordRegister>(_changedPassword);
    on<ChangedNameUserRegister>(_changedUserName);
    on<ChangedPhoneNumberRegister>(_changedPhoneNumber);
    on<RegisterSummit>(_registerSummit);
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

  Future<void> _registerSummit(
      RegisterSummit event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(registerStatus: RegisterStatus.loading),
    );
    final result = await socialUseCase.registerWithEmailPassword(
      email: state.email,
      password: state.password,
    );
    result.fold((error) {
      emit(
        state.copyWith(
            messages: error.messenger, registerStatus: RegisterStatus.error),
      );
    }, (data) {
      createUser(data);
      emit(state.copyWith(registerStatus: RegisterStatus.loaded));
    });
  }

  Future<void> createUser(String uid) async {
    await socialUseCase.remoteFireBaseCloud.createUser(
      user: User(
          name: state.userName,
          gender: "trai",
          age: 16,
          email: state.email,
          uid: uid),
    );
  }
}
