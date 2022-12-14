import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/chat.dart';
import '../../../data/models/firebase/messages.dart';

abstract class ChatEvent extends Equatable {}

class GetAllMatch extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class GetAllChat extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class GetAllMessage extends ChatEvent {
  final String groupChatId;

  GetAllMessage({required this.groupChatId});

  @override
  List<Object?> get props => [groupChatId];
}

class SeenMessageEvent extends ChatEvent {
  final Chat chat;
  final Message message;
  final String groupChatId;

  SeenMessageEvent(
      {required this.chat, required this.message, required this.groupChatId});

  @override
  List<Object?> get props => [chat,message,groupChatId];
}
class ChangedMessage extends ChatEvent{
  final String message;

  ChangedMessage(this.message);

  @override
  List<Object?> get props => [message];

}
class UploadImageMessageEvent extends ChatEvent{
  final File file;
  final String uid;
  final Chat chat;

  final String groupChatId;
  final String receiver;

  UploadImageMessageEvent({required this.chat,required this.receiver,required this.groupChatId, required this.file,required this.uid});

  @override
  List<Object?> get props => [file, uid,receiver,groupChatId,chat];

}
