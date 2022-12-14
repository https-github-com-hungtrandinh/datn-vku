import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:clean_architecture/data/models/firebase/like.dart';
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
    on<UpdateCheckMatch>(_updateCheckMatch);
  }
  void _updateCheckMatch(UpdateCheckMatch event, Emitter<HomeState> emit){
    emit(state.copyWith(checkMatch: false));
  }

  void _userWatch(UserWatchEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(userWatch: event.userWatch));
  }

  Future<void> _userLike(UserLikeEvent event, Emitter<HomeState> emit) async {
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    socialUseCase.userLike(
        userLike: UserLike(uidLike: uid, uidLiked: [event.liked]));
    final resultCheckMatch =
        await socialUseCase.checkMatch(like: uid, liked: event.liked);
    resultCheckMatch.fold((error) {}, (data) {
      emit(state.copyWith(checkMatch: data, like: uid, liked: event.liked));
    });
    final List<String> userMatchID = [uid, event.liked];
    final List<UserModel> userMatch = [];
    for (var user in userMatchID) {
      final resultUser = await socialUseCase.getUser(uid: user);
      resultUser.fold((l) => null, (data) => userMatch.add(data));
    }
    emit(state.copyWith(userMatch: userMatch));

    if (state.checkMatch) {
      await createGroupChat(uidLike: uid, uidLiked: event.liked, emit: emit);
      await socialUseCase.matching(
          uidLike: uid, uidLiked: event.liked, chatId: state.chatId);
    }
    emit(state.copyWith(liked: event.liked));
  }

  Future<void> createGroupChat(
      {required String uidLike,
      required String uidLiked,
      required Emitter<HomeState> emit}) async {
    final result = await socialUseCase.createGroupChat(
        uidLike: uidLike, uidLiked: uidLiked);
    result.fold((error) {}, (data) {
      emit(state.copyWith(chatId: data));
    });
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

      if (state.allUserLike == null) {
        listAllUser.addAll(data);
      } else {
        for (var i in state.allUserLike!.uidLiked) {
          data.removeWhere((element) {
            return element.uid == i;
          });
        }
        listAllUser.addAll(data);
      }

      emit(state.copyWith(
          allUser: listAllUser, loadUserSwiper: LoadUserSwiper.loaded));
    });
  }
}
