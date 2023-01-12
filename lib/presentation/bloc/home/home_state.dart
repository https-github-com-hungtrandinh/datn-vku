import 'package:clean_architecture/data/models/list_id_recommender.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/firebase/messages.dart';
import '../../../data/models/firebase/user.dart';
import '../../../data/models/firebase/like.dart';

enum LoadUserSwiper { initial, loading, loaded, success }

class HomeState extends Equatable {
  final String? userWatch;
  final String? liked;
  final String uid;
  final LoadUserSwiper loadUserSwiper;
  final List<UserModel> allUser;
  final UserLike? allUserLike;
  final bool checkMatch;
  final String chatId;
  final String like;
  final UserModel? userData;
  final List<UserModel> userMatch;
  final List<UserModel> allUserMatch;
  final List<Message> listMessages;
  final ListIdRecommender? listIdRecommender;

  const HomeState(
      {required this.loadUserSwiper,
      required this.listIdRecommender,
      required this.allUserMatch,
      required this.userData,
      required this.uid,
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
        userData: null,
        listIdRecommender: null,
        uid: "",
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
      String? uid,
      UserModel? userData,
      List<UserModel>? userMatch,
      List<UserModel>? allUserMatch,
      ListIdRecommender? listIdRecommender,
      List<UserModel>? allUser}) {
    return HomeState(
        listIdRecommender: listIdRecommender ?? this.listIdRecommender,
        userData: userData ?? this.userData,
        userMatch: userMatch ?? this.userMatch,
        uid: uid ?? this.uid,
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
        listIdRecommender,
        allUserLike,
        checkMatch,
        chatId,
        allUserMatch,
        listMessages,
        like,
        uid,
        userMatch,
        userData
      ];
}
