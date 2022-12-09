import 'dart:developer';

import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:clean_architecture/data/models/firebase/user_like.dart';
import 'package:clean_architecture/presentation/bloc/home/home_event.dart';
import 'package:clean_architecture/presentation/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../../domain/usecases/social_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SocialUseCase socialUseCase;

  HomeBloc(this.socialUseCase) : super(HomeState.initial()) {
    on<UserWatchEvent>(_userWatch);
    on<UserLikeEvent>(_userLike);
    on<GetAllUser>(_getAllUser);
  }

  void _userWatch(UserWatchEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(userWatch: event.userWatch));
  }

  Future<void> _userLike(UserLikeEvent event, Emitter<HomeState> emit) async {
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    socialUseCase.userLike(userLike: UserLike(like: uid, liked: event.liked));
    final resultCheckMatch =
        await socialUseCase.checkMatch(like: uid, liked: event.liked);
    resultCheckMatch.fold((error) {}, (data) {
     log("$data");
      emit(state.copyWith(checkMatch: data));
    });
    emit(state.copyWith(liked: event.liked));
  }

  Future<void> _getAllUser(GetAllUser event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loadUserSwiper: LoadUserSwiper.loading));

    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    final userLike = await socialUseCase.getAllMyUserLike(uid: uid);
    userLike.fold((error) {}, (data) {
      emit(state.copyWith(allUserLike: data));
    });
    final allUser = await socialUseCase.getAllUser(uid: uid);

    allUser.fold((error) {}, (data) {
      final List<UserModel> listAllUser = [];
      if (state.allUserLike.isEmpty) {
        listAllUser.addAll(data);
      } else {
        for (var i in state.allUserLike) {
          data.removeWhere((element) {
            return element.uid == i.liked;
          });
        }
        listAllUser.addAll(data);
      }

      emit(state.copyWith(
          allUser: listAllUser, loadUserSwiper: LoadUserSwiper.loaded));
    });
  }
}
