import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:equatable/equatable.dart';

enum ProfileStatus { initial, loading, loaded, error }

class ProfileState extends Equatable {
  final UserModel? userModel;
  final ProfileStatus profileStatus;

  const ProfileState({required this.userModel, required this.profileStatus});

  factory ProfileState.initial() {
    return const ProfileState(
        userModel: null, profileStatus: ProfileStatus.initial);
  }

  ProfileState copyWith({UserModel? userModel, ProfileStatus? profileStatus}) {
    return ProfileState(
        userModel: userModel ?? this.userModel,
        profileStatus: profileStatus ?? this.profileStatus);
  }

  @override
  List<Object?> get props => [profileStatus, userModel];
}
