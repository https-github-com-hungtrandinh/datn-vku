import 'dart:io';

import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:equatable/equatable.dart';

enum ProfileStatus { initial, loading, loaded, error }

class ProfileState extends Equatable {
  final UserModel? userModel;
  final ProfileStatus profileStatus;
  final File? file;
  final String urlPhoto;

  const ProfileState({
    required this.userModel,
    required this.urlPhoto,
    required this.profileStatus,
    required this.file,
  });

  factory ProfileState.initial() {
    return const ProfileState(
        userModel: null, profileStatus: ProfileStatus.initial, file: null, urlPhoto: "");
  }

  ProfileState copyWith(
      {UserModel? userModel, ProfileStatus? profileStatus, File? file,String? urlPhoto}) {
    return ProfileState(
        file: file ?? this.file,
        urlPhoto: urlPhoto ?? this.urlPhoto,
        userModel: userModel ?? this.userModel,
        profileStatus: profileStatus ?? this.profileStatus);
  }

  @override
  List<Object?> get props => [profileStatus, userModel, file,urlPhoto];
}
