import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable{

}
class GetUserProfile extends ProfileEvent{
  @override
  List<Object?> get props =>[];
}
class ChangedOpinion extends ProfileEvent{
  final String opinion;
  ChangedOpinion({required this.opinion});
  @override
  List<Object?> get props => [opinion];
}
class ChangedAvatar extends ProfileEvent{
  final File file;
  ChangedAvatar({required this.file});
  @override
  List<Object?> get props =>[file];

}

