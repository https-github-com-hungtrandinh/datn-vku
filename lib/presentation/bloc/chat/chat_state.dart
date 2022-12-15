import 'package:clean_architecture/data/models/firebase/chat.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/chat_user.dart';
import '../../../data/models/firebase/match.dart';

import '../../../data/models/firebase/messages.dart';
import '../../../data/models/firebase/user.dart';

enum LoadListMatchStatus { initial, loading, loaded, error }

class ChatState extends Equatable {
  final List<ChatUser> allUserMatch;
  final List<Chat> listChat;
  final List<MatchUser> listMatch;
  final List<Message> listMessage;
  final String uid;
  final UserModel? user;
  final String message;
  final String receiverId;
  final String urlImage;
  final LoadListMatchStatus loadListMatchStatus;

  const ChatState(
      {required this.allUserMatch,
      required this.receiverId,
      required this.urlImage,
      required this.listMatch,
      required this.user,
      required this.message,
      required this.uid,
      required this.listChat,
      required this.listMessage,
      required this.loadListMatchStatus});

  factory ChatState.initial() {
    return const ChatState(
        receiverId: "",
        allUserMatch: [],
        urlImage: '',
        uid: "",
        user: null,
        message: "",
        listMatch: [],
        listChat: [],
        listMessage: [],
        loadListMatchStatus: LoadListMatchStatus.initial);
  }

  ChatState copyWith(
      {List<ChatUser>? allUserMatch,
      List<Chat>? listChat,
      List<MatchUser>? listMatch,
      List<Message>? listMessage,
      String? uid,
      String? message,
      String? urlImage,
      String? receiverId,
      UserModel? user,
      LoadListMatchStatus? loadListMatchStatus}) {
    return ChatState(
        uid: uid ?? this.uid,
        urlImage: urlImage ?? this.urlImage,
        receiverId: receiverId ?? this.receiverId,
        user: user ?? this.user,
        message: message ?? this.message,
        listMessage: listMessage ?? this.listMessage,
        listMatch: listMatch ?? this.listMatch,
        allUserMatch: allUserMatch ?? this.allUserMatch,
        listChat: listChat ?? this.listChat,
        loadListMatchStatus: loadListMatchStatus ?? this.loadListMatchStatus);
  }

  @override
  List<Object?> get props => [
        allUserMatch,
        listChat,
        loadListMatchStatus,
        listMatch,
        listMessage,
        message,
        uid,
        user,
        receiverId,
        urlImage
      ];
}
