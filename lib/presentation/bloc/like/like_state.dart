import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/like.dart';
import '../../../data/models/firebase/user.dart';


enum LikeStatus{
  loading,
  loaded,
  error,
  initial
}
class LikeState extends Equatable {
  final UserLike? listIdLike;
  final List<UserModel> listUser;
  final LikeStatus likeStatus;

  const LikeState({required this.listIdLike, required this.listUser, required this.likeStatus});

  factory LikeState.initial() {
    return const LikeState(listIdLike: null, listUser: [],likeStatus: LikeStatus.initial);
  }

  LikeState copyWith({UserLike? listIdLike, List<UserModel>? listUser,LikeStatus? likeStatus}) {
    return LikeState(
      likeStatus: likeStatus ?? this.likeStatus,
        listIdLike: listIdLike ?? this.listIdLike,
        listUser: listUser ?? this.listUser);
  }

  @override
  List<Object?> get props => [listIdLike, listUser,likeStatus];
}
