import 'package:equatable/equatable.dart';
import '../../../data/models/firebase/messages.dart';
import '../../../data/models/firebase/user.dart';
import '../../../data/models/firebase/like.dart';

enum LoadUserSwiper { initial, loading, loaded, success }

class HomeState extends Equatable {
  final String? userWatch;
  final String? liked;
  final LoadUserSwiper loadUserSwiper;
  final List<UserModel> allUser;
  final UserLike? allUserLike;
  final bool checkMatch;
  final String chatId;
  final String like;
  final List<UserModel> userMatch;
  final List<UserModel> allUserMatch;
  final List<Message> listMessages;

  const HomeState(
      {required this.loadUserSwiper,
      required this.allUserMatch,
      required this.like,
      required this.userMatch,
      required this.listMessages,
      required this.liked,
      required this.chatId,
      required this.checkMatch,
      required this.allUser,
      required this.allUserLike,
      required this.userWatch});

  factory HomeState.initial() {
    return const HomeState(
        listMessages: [],
        allUserMatch: [],
        checkMatch: false,
        like: "",
        userMatch: [],
        allUserLike: null,
        chatId: '',
        loadUserSwiper: LoadUserSwiper.initial,
        allUser: [],
        liked: null,
        userWatch: null);
  }

  HomeState copyWith(
      {LoadUserSwiper? loadUserSwiper,
      String? liked,
      String? like,
      List<Message>? listMessages,
      UserLike? allUserLike,
      String? userWatch,
      bool? checkMatch,
      String? chatId,
      List<UserModel>? userMatch,
      List<UserModel>? allUserMatch,
      List<UserModel>? allUser}) {
    return HomeState(
        userMatch: userMatch ?? this.userMatch,
        like: like ?? this.like,
        listMessages: listMessages ?? this.listMessages,
        allUserMatch: allUserMatch ?? this.allUserMatch,
        chatId: chatId ?? this.chatId,
        checkMatch: checkMatch ?? this.checkMatch,
        allUserLike: allUserLike ?? this.allUserLike,
        allUser: allUser ?? this.allUser,
        loadUserSwiper: loadUserSwiper ?? this.loadUserSwiper,
        liked: liked ?? this.liked,
        userWatch: userWatch ?? this.userWatch);
  }

  @override
  List<Object?> get props => [
        loadUserSwiper,
        liked,
        userWatch,
        allUser,
        allUserLike,
        checkMatch,
        chatId,
        allUserMatch,
        listMessages,
        like,
        userMatch
      ];
}
