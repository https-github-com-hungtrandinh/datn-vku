import 'package:clean_architecture/data/models/firebase/chat.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/match.dart';

import '../../../data/models/firebase/messages.dart';
import '../../../data/models/firebase/user.dart';

enum LoadListMatchStatus { initial, loading, loaded, error }

class ChatState extends Equatable {
  final List<UserModel> allUserMatch;
  final List<Chat> listChat;
  final List<MatchUser> listMatch;
  final List<Message> listMessage;
  final String uid;
  final LoadListMatchStatus loadListMatchStatus;

  const ChatState(
      {required this.allUserMatch,
      required this.listMatch,
      required this.uid,
      required this.listChat,
      required this.listMessage,
      required this.loadListMatchStatus});

  factory ChatState.initial() {
    return const ChatState(
        allUserMatch: [],
        uid: "",
        listMatch: [],
        listChat: [],
        listMessage: [],
        loadListMatchStatus: LoadListMatchStatus.initial);
  }

  ChatState copyWith(
      {List<UserModel>? allUserMatch,
      List<Chat>? listChat,
      List<MatchUser>? listMatch,
      List<Message>? listMessage,
      String? uid,
      LoadListMatchStatus? loadListMatchStatus}) {
    return ChatState(
        uid: uid ?? this.uid,
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
        uid
      ];
}
