import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class ChangedEmailRegister extends RegisterEvent {
  final String email;

  ChangedEmailRegister(this.email);

  @override
  List<Object?> get props => [email];
}

class ChangedPasswordRegister extends RegisterEvent {
  final String password;

  ChangedPasswordRegister(this.password);

  @override
  List<Object?> get props => [password];
}

class ChangedPhoneNumberRegister extends RegisterEvent {
  final String numberPhone;

  ChangedPhoneNumberRegister(this.numberPhone);

  @override
  List<Object?> get props => [numberPhone];
}

class ChangedNameUserRegister extends RegisterEvent {
  final String nameUser;

  ChangedNameUserRegister(this.nameUser);

  @override
  List<Object?> get props => [nameUser];
}

class ChangedMaleUserRegister extends RegisterEvent {
  final String male;

  ChangedMaleUserRegister(this.male);

  @override
  List<Object?> get props => [male];
}

class RegisterSummit extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class RegisterPush extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class GetMajor extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class RegisterPop extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class SearchMajor extends RegisterEvent {
  final String major;

  SearchMajor(this.major);

  @override
  List<Object?> get props => [major];
}

class ChangedMajor extends RegisterEvent {
  final String major;

  ChangedMajor(this.major);

  @override
  List<Object?> get props => [major];
}

class ChangedBirthDay extends RegisterEvent {
  final String birthDay;

  ChangedBirthDay(this.birthDay);

  @override
  List<Object?> get props => [birthDay];
}
class GetPersonality extends RegisterEvent{
  @override
  List<Object?> get props =>[];

}
class GetLifestyle extends RegisterEvent{
  @override
  List<Object?> get props =>[];

}
class ChangedAnswerPersonality extends RegisterEvent{
  final int answerPersonality;
  ChangedAnswerPersonality(this.answerPersonality);

  @override
  List<Object?> get props =>[answerPersonality];
}
class ChangedAnswerLifeStyle extends RegisterEvent{
  final bool answerLifestyle;
  ChangedAnswerLifeStyle(this.answerLifestyle);
  @override
  List<Object?> get props => [answerLifestyle];

}