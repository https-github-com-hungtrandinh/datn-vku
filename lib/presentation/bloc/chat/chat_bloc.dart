import 'dart:async';
import 'dart:developer';

import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:clean_architecture/data/models/firebase/messages.dart';
import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_event.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/firebase/chat.dart';
import '../../../data/models/firebase/chat_user.dart';
import '../../../domain/usecases/social_usecase.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SocialUseCase socialUseCase;
  StreamSubscription? _chatSubscription;

  ChatBloc(this.socialUseCase) : super(ChatState.initial()) {
    on<GetAllChat>(_getAllChat);
    on<GetAllMatch>(_getAllMatch);
    on<GetAllMessage>(_getAllMessage);
    on<SeenMessageEvent>(_seenMessage);
    on<ChangedMessage>(_changedMessage);
    on<UploadImageMessageEvent>(_updateImageMessage);
  }

  Future<void> _getAllMatch(GetAllMatch event, Emitter<ChatState> emit) async {
    emit(state.copyWith(loadListMatchStatus: LoadListMatchStatus.loading));
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    final user = await socialUseCase.getUser(uid: uid);
    user.fold((error) {}, (data) {
      emit(state.copyWith(user: data));
    });
    final result = await socialUseCase.getAllMatchId(uid: uid);
    result.fold(
        (error) {}, (data) => emit(state.copyWith(listMatch: data, uid: uid)));

    final userMatch =
        await socialUseCase.getAllUserMatch(listMatch: state.listMatch);
    userMatch.fold((error) {
      emit(state.copyWith(loadListMatchStatus: LoadListMatchStatus.error));
    }, (data) {
      final List<ChatUser> allChatUser = data;
      emit(state.copyWith(
        allUserMatch: allChatUser,
        loadListMatchStatus: LoadListMatchStatus.loaded,
      ));
    });
  }

  void _changedMessage(ChangedMessage event, Emitter<ChatState> emit) {
    emit(state.copyWith(message: event.message));
  }

  Future<void> _seenMessage(
      SeenMessageEvent event, Emitter<ChatState> emit) async {
    final result = await socialUseCase.seenMessage(
      message: event.message,
      groupChatId: event.groupChatId,
    );
    result.fold((error) {}, (data) {});
  }

  Future<void> _updateImageMessage(
      UploadImageMessageEvent event, Emitter<ChatState> emit) async {
    final result =
        await socialUseCase.seenImage(uid: event.uid, imageFile: event.file);
    result.fold((error) {}, (data) {
      emit(state.copyWith(urlImage: data));
    });
    final resultMessage = await socialUseCase.seenMessage(
      message: Message(
          senderId: state.uid,
          receiverId: event.receiver,
          message: state.urlImage,
          messageType: MessageType.image,
          dateTime: DateTime.now()),
      groupChatId: event.groupChatId,
    );
    result.fold((error) {}, (data) {});
  }

  void _getAllMessage(GetAllMessage event, Emitter<ChatState> emit) async {
    await emit
        .forEach(socialUseCase.getAllMessage(groupChatId: event.groupChatId),
            onData: (List<Message> message) {
      return state.copyWith(listMessage: message);
    });
  }

  void _getAllChat(GetAllChat event, Emitter<ChatState> emit) async {
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);

    await emit.forEach(socialUseCase.getAllChat(uid: uid),
        onData: (List<Chat> event) {
      return state.copyWith(listChat: event);
    });
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }
}
