import 'package:clean_architecture/data/models/firebase/like.dart';
import 'package:clean_architecture/presentation/bloc/home/home_event.dart';
import 'package:clean_architecture/presentation/bloc/like/like_event.dart';
import 'package:clean_architecture/presentation/bloc/like/like_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../../data/models/firebase/user.dart';
import '../../../domain/usecases/social_usecase.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final SocialUseCase socialUseCase;

  LikeBloc(this.socialUseCase) : super(LikeState.initial()){
   on<GetAllIdUserEvent>(_getAllIdUserLike);
  }

  void _getAllIdUserLike(
      GetAllIdUserEvent event, Emitter<LikeState> emit) async {
    emit(state.copyWith(likeStatus: LikeStatus.loading));
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
   final result =await socialUseCase.getIdUserLike(docId: uid);
   result.fold((error) {}, (data){
     emit(state.copyWith(listIdLike: data,likeStatus: LikeStatus.loaded));
   });
    await emit
        .forEach(socialUseCase.getAllUserLike(userLike: state.listIdLike!),
        onData: (List<UserModel> listUser) {
          return state.copyWith(listUser: listUser);
        });
  }


}
