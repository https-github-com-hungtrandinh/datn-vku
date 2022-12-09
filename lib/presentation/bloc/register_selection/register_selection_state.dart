import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/interest.dart';
import '../../../data/models/firebase/lifestyle.dart';
import '../../../data/models/firebase/major.dart';
import '../../../data/models/firebase/personality.dart';

enum InterestStatus {
  loading,
  initial,
  loaded,
  error,
}

enum RegisterSelectionStatus {
  loading,
  initial,
  loaded,
  error,
}

class RegisterSelectionState extends Equatable {
  List<InterestModel> listInterest;
  List<String> interest;
  final InterestStatus interestStatus;
  final File? file;
  final RegisterSelectionStatus registerSelectionStatus;
  final String userName;
  final String messages;
  final String gender;
  final String? imageUrl;
  final String major;
  final String searchMajor;
  final DateTime? birthDay;
  List<Major> listMajor;
  List<Major> listMajorInSearch;
  final List<PersonalityQuestion> listPersonalityQuestion;
  final List<LifestyleQuestionModel> listLifestyleQuestion;
  final List<int> listPersonalitySelect;
  final List<bool> listLifestyleSelect;
  int registerStep;

  RegisterSelectionState(
      {required this.imageUrl,
      required this.registerSelectionStatus,
      required this.listLifestyleSelect,
      required this.listPersonalitySelect,
      required this.listLifestyleQuestion,
      required this.listPersonalityQuestion,
      required this.gender,
      required this.listMajor,
      required this.major,
      required this.birthDay,
      required this.listMajorInSearch,
      required this.searchMajor,
      required this.registerStep,
      required this.messages,
      required this.userName,
      required this.interest,
      required this.interestStatus,
      required this.file,
      required this.listInterest});

  factory RegisterSelectionState.initial() {
    return RegisterSelectionState(
        registerSelectionStatus: RegisterSelectionStatus.initial,
        listLifestyleSelect: [],
        listPersonalitySelect: [],
        imageUrl: null,
        listLifestyleQuestion: const [],
        listPersonalityQuestion: const [],
        major: '',
        birthDay: null,
        listMajor: const [],
        listMajorInSearch: const [],
        searchMajor: '',
        gender: '',
        registerStep: 0,
        userName: '',
        messages: '',
        interest: [],
        file: null,
        interestStatus: InterestStatus.initial,
        listInterest: const []);
  }

  RegisterSelectionState copyWith(
      {List<String>? interest,
      DateTime? birthDay,
      String? userName,
      String? messages,
      String? gender,
      List<int>? listPersonalitySelect,
      List<bool>? listLifestyleSelect,
      String? imageUrl,
      int? registerStep,
      List<Major>? listMajor,
      String? searchMajor,
      String? major,
      RegisterSelectionStatus? registerSelectionStatus,
      List<PersonalityQuestion>? listPersonalityQuestion,
      List<Major>? listMajorInSearch,
      List<LifestyleQuestionModel>? listLifestyleQuestion,
      InterestStatus? interestStatus,
      File? file,
      List<InterestModel>? listInterest}) {
    return RegisterSelectionState(
        registerSelectionStatus:
            registerSelectionStatus ?? this.registerSelectionStatus,
        listPersonalitySelect:
            listPersonalitySelect ?? this.listPersonalitySelect,
        listLifestyleSelect: listLifestyleSelect ?? this.listLifestyleSelect,
        imageUrl: imageUrl ?? this.imageUrl,
        listPersonalityQuestion:
            listPersonalityQuestion ?? this.listPersonalityQuestion,
        listLifestyleQuestion:
            listLifestyleQuestion ?? this.listLifestyleQuestion,
        birthDay: birthDay ?? this.birthDay,
        searchMajor: searchMajor ?? this.searchMajor,
        gender: gender ?? this.gender,
        listMajor: listMajor ?? this.listMajor,
        registerStep: registerStep ?? this.registerStep,
        messages: messages ?? this.messages,
        userName: userName ?? this.userName,
        listMajorInSearch: listMajorInSearch ?? this.listMajorInSearch,
        major: major ?? this.major,
        file: file ?? this.file,
        interest: interest ?? this.interest,
        interestStatus: interestStatus ?? this.interestStatus,
        listInterest: listInterest ?? this.listInterest);
  }

  @override
  List<Object?> get props => [
        listInterest,
        interest,
        interestStatus,
        file,
        userName,
        messages,
        gender,
        registerStep,
        listMajor,
        searchMajor,
        listMajorInSearch,
        major,
        birthDay,
        listPersonalityQuestion,
        listLifestyleQuestion,
        registerSelectionStatus,
        imageUrl,
        listLifestyleSelect,
        listPersonalitySelect
      ];
}
