import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable{

}

class GetUserProfile extends ProfileEvent{
  @override
  List<Object?> get props =>[];
}
class ChangedStatus extends ProfileEvent{
  final String status;

  ChangedStatus(this.status);

  @override
  List<Object?> get props =>[status];
}
class ChangedPost extends ProfileEvent{
  final File file;

  ChangedPost(this.file);

  @override
  List<Object?> get props => [file];

}
class ChangedDatingPurpose extends ProfileEvent{
  final String datingPurpose;
  ChangedDatingPurpose(this.datingPurpose);

  @override
  List<Object?> get props => [datingPurpose];
}
class ChangedInterests extends ProfileEvent{
  final String interests;

  ChangedInterests(this.interests);

  @override
  List<Object?> get props => [interests];
}