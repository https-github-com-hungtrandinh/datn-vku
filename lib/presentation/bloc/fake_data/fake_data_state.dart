import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/user.dart';

enum FakeDataStatus {
  loading,
  loaded,
  error,
  initial,
}

class FakeDataState extends Equatable {
  final FakeDataStatus fakeDataStatus;
  final String uid;
  final List<UserModel>? allUser;

  const FakeDataState({required this.fakeDataStatus, required this.uid, required this.allUser});

  factory FakeDataState.initial() {
    return const FakeDataState(fakeDataStatus: FakeDataStatus.initial, uid: "", allUser: null);
  }

  FakeDataState copyWith({String? uid, FakeDataStatus? fakeDataStatus,List<UserModel>? allUser}) {
    return FakeDataState(
        fakeDataStatus: fakeDataStatus ?? this.fakeDataStatus,
        allUser: allUser ?? this.allUser,
        uid: uid ?? this.uid);
  }

  @override
  List<Object?> get props => [fakeDataStatus, uid,allUser];
}
