import 'package:clean_architecture/core/util/validate.dart';
import 'package:clean_architecture/data/models/firebase/major.dart';
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
    on<RegisterPush>(_registerPush);
    on<RegisterPop>(_registerPop);
    on<ChangedMaleUserRegister>(_changeGender);
    on<GetMajor>(_getMajor);
    on<SearchMajor>(_searchMajor);
    on<ChangedMajor>(_changedMajor);
    on<ChangedBirthDay>(_changedBirthDay);
    on<GetPersonality>(getPersonality);
    on<ChangedAnswerPersonality>(_changedAnswerPersonality);
    on<ChangedAnswerLifeStyle>(_changedLifestyle);
    on<GetLifestyle>(getLifeStyle);
  }

  void _registerPush(RegisterPush event, Emitter<RegisterState> emit) {
    emit(state.copyWith(registerStep: state.registerStep + 1));
  }

  void _registerPop(RegisterPop event, Emitter<RegisterState> emit) {
    emit(state.copyWith(registerStep: state.registerStep - 1));
  }

  void _changeGender(
      ChangedMaleUserRegister event, Emitter<RegisterState> emit) {
    emit(state.copyWith(gender: event.male));
  }

  void _changedEmail(ChangedEmailRegister event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
          email: event.email, emailValidate: event.email.isValidEmail()),
    );
  }

  void _changedPassword(
      ChangedPasswordRegister event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
          password: event.password,
          passwordValidate: event.password.isValidatePassword()),
    );
  }

  void _changedUserName(
      ChangedNameUserRegister event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(userName: event.nameUser),
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
    if (state.passwordValidate == false && state.emailValidate == false) {
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

  void _searchMajor(SearchMajor event, Emitter<RegisterState> emit) {
    final List<Major> listNewMajor = [];
    listNewMajor.addAll(state.listMajor
        .where((element) => element.major.toLowerCase().contains(event.major)));
    emit(state.copyWith(listMajorInSearch: listNewMajor));
  }

  Future<void> _getMajor(GetMajor event, Emitter<RegisterState> emit) async {
    final result = await socialUseCase.getMajor();
    result.fold((error) {}, (data) {
      emit(state.copyWith(listMajor: data));
    });
  }

  void _changedMajor(ChangedMajor event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(major: event.major));
  }

  void _changedAnswerPersonality(
      ChangedAnswerPersonality event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(answerPersonality: event.answerPersonality));
  }

  void _changedLifestyle(
      ChangedAnswerLifeStyle event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(answerLifestyle: event.answerLifestyle));
  }

  void _changedBirthDay(
      ChangedBirthDay event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(birthDay: event.birthDay));
  }

  Future<void> getPersonality(
      GetPersonality event, Emitter<RegisterState> emit) async {
    final result = await socialUseCase.getPersonality();
    result.fold((error) {}, (data) {
      emit(state.copyWith(listPersonalityQuestion: data));
    });
  }

  Future<void> getLifeStyle(
      GetLifestyle event, Emitter<RegisterState> emit) async {
    final result = await socialUseCase.getLifestyle();
    result.fold((error) {}, (data) {
      emit(state.copyWith(listLifestyleQuestion: data));
    });
  }
}
