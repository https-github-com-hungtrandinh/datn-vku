import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:equatable/equatable.dart';

enum ProfileStatus { initial, loading, loaded, error }

enum PostStatus { initial, loading, loaded, error }

class ProfileState extends Equatable {
  final UserModel? userModel;
  final ProfileStatus profileStatus;
  final PostStatus postStatus;
  final String status;
  final List<String> interest;
  final String datingPurpose;

  const ProfileState(
      {required this.userModel,
      required this.interest,
      required this.postStatus,
      required this.datingPurpose,
      required this.profileStatus,
      required this.status});

  factory ProfileState.initial() {
    return const ProfileState(
        status: "",
        postStatus: PostStatus.initial,
        userModel: null,
        profileStatus: ProfileStatus.initial,
        interest: [],
        datingPurpose: "");
  }

  ProfileState copyWith(
      {UserModel? userModel,
      ProfileStatus? profileStatus,
      String? status,
      PostStatus? postStatus,
      List<String>? interest,
      String? datingPurpose}) {
    return ProfileState(
        postStatus: postStatus ?? this.postStatus,
        interest: interest ?? this.interest,
        status: status ?? this.status,
        datingPurpose: datingPurpose ?? this.datingPurpose,
        userModel: userModel ?? this.userModel,
        profileStatus: profileStatus ?? this.profileStatus);
  }

  @override
  List<Object?> get props =>
      [profileStatus, userModel, datingPurpose, status, interest, postStatus];
}
