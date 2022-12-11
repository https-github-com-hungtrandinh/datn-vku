import 'dart:async';
import 'dart:developer';

import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_event.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/firebase/chat.dart';
import '../../../domain/usecases/social_usecase.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SocialUseCase socialUseCase;
  StreamSubscription? _chatSubscription;

  ChatBloc(this.socialUseCase) : super(ChatState.initial()) {
    on<GetAllMessages>(_getAllMessages);
    on<GetAllMatch>(_getAllMatch);
  }

  Future<void> _getAllMatch(GetAllMatch event, Emitter<ChatState> emit) async {
    emit(state.copyWith(loadListMatchStatus: LoadListMatchStatus.loading));
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    final result = await socialUseCase.getAllMatchId(uid: uid);
    result.fold((error) {}, (data) => emit(state.copyWith(listMatch: data)));

    final userMatch =
        await socialUseCase.getAllUserMatch(listMatch: state.listMatch);
    userMatch.fold((error) {
      emit(state.copyWith(loadListMatchStatus: LoadListMatchStatus.error));
    }, (data) {
      emit(state.copyWith(
        allUserMatch: data,
        loadListMatchStatus: LoadListMatchStatus.loaded,
      ));
    });
  }

  void _getAllMessages(GetAllMessages event, Emitter<ChatState> emit) async {
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);

    await emit.forEach(socialUseCase.getAllMessages(uid: uid),
        onData: (List<Chat> event) {
      log("${event[0].userIds}");
      return state.copyWith(listMessages: event);
    });
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }
}
