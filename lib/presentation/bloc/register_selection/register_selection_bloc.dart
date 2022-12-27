import 'dart:developer';

import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:clean_architecture/data/models/firebase/user_question.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_event.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/firebase/major.dart';
import '../../../domain/usecases/social_usecase.dart';

class RegisterSelectionBloc
    extends Bloc<RegisterSelectionEvent, RegisterSelectionState> {
  final SocialUseCase socialUseCase;

  RegisterSelectionBloc(this.socialUseCase)
      : super(RegisterSelectionState.initial()) {
    on<ChangedAddInterestEvent>(_changedAddInterest);
    on<GetInterestEvent>(_getInterest);
    on<ChangedRemoveInterestEvent>(_changedRemoveInterest);
    on<ChangedAvatar>(_changedAvatar);
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
    on<ChangedNameUserRegister>(_changedUserName);
    on<SummitSelectionRegister>(_summitRegisterSelection);
    on<UpdateRecommendation>(_updateRecommendation);
  }

  void _changedAddInterest(ChangedAddInterestEvent event,
      Emitter<RegisterSelectionState> emit) {
    List<String> interest = state.interest;
    interest.add(event.interest);
    emit(state.copyWith(interest: interest));
  }

  void _changedRemoveInterest(ChangedRemoveInterestEvent event,
      Emitter<RegisterSelectionState> emit) {
    List<String> interest = state.interest;
    interest.remove(event.interest);
    emit(state.copyWith(interest: interest));
  }

  void _changedAvatar(ChangedAvatar event,
      Emitter<RegisterSelectionState> emit) {
    log("${event.file}");
    emit(state.copyWith(file: event.file));
  }

  Future<void> _getInterest(GetInterestEvent event,
      Emitter<RegisterSelectionState> emit) async {
    emit(state.copyWith(interestStatus: InterestStatus.loading));
    final result = await socialUseCase.getInterest();
    result.fold((error) {
      emit(state.copyWith(interestStatus: InterestStatus.error));
    }, (data) {
      emit(state.copyWith(
          listInterest: data, interestStatus: InterestStatus.loaded));
    });
  }

  void _registerPush(RegisterPush event, Emitter<RegisterSelectionState> emit) {
    emit(state.copyWith(registerStep: state.registerStep + 1));
  }

  void _registerPop(RegisterPop event, Emitter<RegisterSelectionState> emit) {
    emit(state.copyWith(registerStep: state.registerStep - 1));
  }

  void _changeGender(ChangedMaleUserRegister event,
      Emitter<RegisterSelectionState> emit) {
    emit(state.copyWith(gender: event.male));
  }

  void _changedUserName(ChangedNameUserRegister event,
      Emitter<RegisterSelectionState> emit) {
    emit(
      state.copyWith(userName: event.nameUser),
    );
  }

  void _searchMajor(SearchMajor event, Emitter<RegisterSelectionState> emit) {
    final List<Major> listNewMajor = [];
    listNewMajor.addAll(state.listMajor
        .where((element) => element.major.toLowerCase().contains(event.major)));
    emit(state.copyWith(listMajorInSearch: listNewMajor));
  }

  Future<void> _getMajor(GetMajor event,
      Emitter<RegisterSelectionState> emit) async {
    final result = await socialUseCase.getMajor();
    result.fold((error) {}, (data) {
      emit(state.copyWith(listMajor: data));
    });
  }

  void _changedMajor(ChangedMajor event,
      Emitter<RegisterSelectionState> emit) async {
    emit(state.copyWith(major: event.major));
  }

  void _changedAnswerPersonality(ChangedAnswerPersonality event,
      Emitter<RegisterSelectionState> emit) async {
    final List<int> personality = state.listPersonalitySelect;
    personality.add(event.answerPersonality);
    emit(state.copyWith(listPersonalitySelect: personality));
  }

  void _changedLifestyle(ChangedAnswerLifeStyle event,
      Emitter<RegisterSelectionState> emit) async {
    final List<bool> lifestyle = state.listLifestyleSelect;
    lifestyle.add(event.answerLifestyle);
    emit(state.copyWith(listLifestyleSelect: lifestyle));
  }

  void _changedBirthDay(ChangedBirthDay event,
      Emitter<RegisterSelectionState> emit) async {
    emit(state.copyWith(birthDay: event.birthDay));
  }

  Future<void> getPersonality(GetPersonality event,
      Emitter<RegisterSelectionState> emit) async {
    final result = await socialUseCase.getPersonality();
    result.fold((error) {}, (data) {
      emit(state.copyWith(listPersonalityQuestion: data));
    });
  }

  Future<void> getLifeStyle(GetLifestyle event,
      Emitter<RegisterSelectionState> emit) async {
    final result = await socialUseCase.getLifestyle();
    result.fold((error) {}, (data) {
      emit(state.copyWith(listLifestyleQuestion: data));
    });
  }

  Future<void> _summitRegisterSelection(SummitSelectionRegister event,
      Emitter<RegisterSelectionState> emit) async {
    emit(state.copyWith(
        registerSelectionStatus: RegisterSelectionStatus.loading));
    final uid =
    await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    final resultAvatar =
    await socialUseCase.addImageProfile(uid: uid, imageFile: state.file!);
    resultAvatar.fold((error) {}, (data) {
      emit(state.copyWith(imageUrl: data));
    });
    addAnswersModel(uid);

    final result = await socialUseCase.updateUserSelection(
        uid: uid,
        name: state.userName,
        birthday: state.birthDay!,
        major: state.major,
        gender: state.gender,
        interests: state.interest,
        photoUrl: state.imageUrl);
    result.fold((error) {
      emit(state.copyWith(
          registerSelectionStatus: RegisterSelectionStatus.error));
    }, (data) {
      emit(state.copyWith(
          registerSelectionStatus: RegisterSelectionStatus.loaded));
    });
  }

  Future<void> addAnswersModel(String uid) async {
    UserAnswersModel userAnswersModel = UserAnswersModel(
        userId: uid,
        personalityAnswer: state.listPersonalitySelect,
        lifestyleAnswer: state.listLifestyleSelect);
    final result = await socialUseCase.addUserAnswers(
        uid: uid, userAnswersModel: userAnswersModel);

    result.fold((error) {}, (data) {});
  }

  Future<void> _updateRecommendation(UpdateRecommendation event,
      Emitter<RegisterSelectionState> emit) async {
    final result = await socialUseCase.updateRecommendation();
  }
}
