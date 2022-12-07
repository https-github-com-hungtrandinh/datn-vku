import 'package:equatable/equatable.dart';
import '../../../data/models/firebase/user.dart';
import '../../../data/models/firebase/user_like.dart';

enum LoadUserSwiper { initial, loading, loaded, success }

class HomeState extends Equatable {
  final String? userWatch;
  final String? liked;
  final LoadUserSwiper loadUserSwiper;
  final List<UserModel> allUser;
  final List<UserLike> allUserLike;
  final bool checkMatch;

  const HomeState(
      {required this.loadUserSwiper,
      required this.liked,
      required this.checkMatch,
      required this.allUser,
      required this.allUserLike,
      required this.userWatch});

  factory HomeState.initial() {
    return const HomeState(
        checkMatch: false,
        allUserLike: [],
        loadUserSwiper: LoadUserSwiper.initial,
        allUser: [],
        liked: null,
        userWatch: null);
  }

  HomeState copyWith(
      {LoadUserSwiper? loadUserSwiper,
      String? liked,
      List<UserLike>? allUserLike,
      String? userWatch,
      bool? checkMatch,
      List<UserModel>? allUser}) {
    return HomeState(
        checkMatch: checkMatch ?? this.checkMatch,
        allUserLike: allUserLike ?? this.allUserLike,
        allUser: allUser ?? this.allUser,
        loadUserSwiper: loadUserSwiper ?? this.loadUserSwiper,
        liked: liked ?? this.liked,
        userWatch: userWatch ?? this.userWatch);
  }

  @override
  List<Object?> get props =>
      [loadUserSwiper, liked, userWatch, allUser, allUserLike, checkMatch];
}
