import 'package:clean_architecture/presentation/bloc/post/post_event.dart';
import 'package:clean_architecture/presentation/bloc/post/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/social_usecase.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final SocialUseCase socialUseCase;

  PostBloc(this.socialUseCase) : super(PostState.initial()) {
    on<GetPostAll>(_getAllPost);
  }

  Future<void> _getAllPost(GetPostAll event, Emitter<PostState> emit) async {
    emit(state.copyWith(loadAllPostStatus: LoadAllPostStatus.loading));
    final result = await socialUseCase.getPostAll();
    result.fold(
        (error) =>
            emit(state.copyWith(loadAllPostStatus: LoadAllPostStatus.error)),
        (data) => emit(state.copyWith(
            loadAllPostStatus: LoadAllPostStatus.loaded, postAll: data)));
  }
}
