import 'dart:io';

import 'package:clean_architecture/presentation/pages/register_slection/register_selection.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterSelectionEvent extends Equatable {}

class GetInterestEvent extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class ChangedAddInterestEvent extends RegisterSelectionEvent {
  final String interest;

  ChangedAddInterestEvent(this.interest);

  @override
  List<Object?> get props => [interest];
}

class ChangedRemoveInterestEvent extends RegisterSelectionEvent {
  final String interest;

  ChangedRemoveInterestEvent(this.interest);

  @override
  List<Object?> get props => [interest];
}

class ChangedAvatar extends RegisterSelectionEvent {
  final File file;

  ChangedAvatar(this.file);

  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

class ChangedNameUserRegister extends RegisterSelectionEvent {
  final String nameUser;

  ChangedNameUserRegister(this.nameUser);

  @override
  List<Object?> get props => [nameUser];
}

class ChangedMaleUserRegister extends RegisterSelectionEvent {
  final String male;

  ChangedMaleUserRegister(this.male);

  @override
  List<Object?> get props => [male];
}

class RegisterSummit extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class RegisterPush extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class GetMajor extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class RegisterPop extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class SearchMajor extends RegisterSelectionEvent {
  final String major;

  SearchMajor(this.major);

  @override
  List<Object?> get props => [major];
}

class ChangedMajor extends RegisterSelectionEvent {
  final String major;

  ChangedMajor(this.major);

  @override
  List<Object?> get props => [major];
}

class ChangedBirthDay extends RegisterSelectionEvent {
  final DateTime birthDay;

  ChangedBirthDay(this.birthDay);

  @override
  List<Object?> get props => [birthDay];
}

class GetPersonality extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class GetLifestyle extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class ChangedAnswerPersonality extends RegisterSelectionEvent {
  final int answerPersonality;

  ChangedAnswerPersonality(this.answerPersonality);

  @override
  List<Object?> get props => [answerPersonality];
}

class ChangedAnswerLifeStyle extends RegisterSelectionEvent {
  final bool answerLifestyle;

  ChangedAnswerLifeStyle(this.answerLifestyle);

  @override
  List<Object?> get props => [answerLifestyle];
}

class SummitSelectionRegister extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class AddAvatar extends RegisterSelectionEvent {
  @override
  List<Object?> get props => [];
}

class UpdateRecommendation extends RegisterSelectionEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
