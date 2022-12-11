import 'package:clean_architecture/data/models/firebase/chat.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/match.dart';
import '../../../data/models/firebase/messages.dart';
import '../../../data/models/firebase/user.dart';

enum LoadListMatchStatus { initial, loading, loaded, error }

class ChatState extends Equatable {
  final List<UserModel> allUserMatch;
  final List<Chat> listMessages;
  final List<MatchUser> listMatch;
  final LoadListMatchStatus loadListMatchStatus;

  const ChatState(
      {required this.allUserMatch,
      required this.listMatch,
      required this.listMessages,
      required this.loadListMatchStatus});

  factory ChatState.initial() {
    return const ChatState(
        allUserMatch: [],
        listMatch: [],
        listMessages: [],
        loadListMatchStatus: LoadListMatchStatus.initial);
  }

  ChatState copyWith(
      {List<UserModel>? allUserMatch,
      List<Chat>? listMessages,
      List<MatchUser>? listMatch,
      LoadListMatchStatus? loadListMatchStatus}) {
    return ChatState(
        listMatch: listMatch ?? this.listMatch,
        allUserMatch: allUserMatch ?? this.allUserMatch,
        listMessages: listMessages ?? this.listMessages,
        loadListMatchStatus: loadListMatchStatus ?? this.loadListMatchStatus);
  }

  @override
  List<Object?> get props =>
      [allUserMatch, listMessages, loadListMatchStatus, listMatch];
}
