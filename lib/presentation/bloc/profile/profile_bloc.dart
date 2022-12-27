import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:clean_architecture/presentation/bloc/profile/profile_event.dart';
import 'package:clean_architecture/presentation/bloc/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/social_usecase.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SocialUseCase socialUseCase;

  ProfileBloc(this.socialUseCase) : super(ProfileState.initial()) {
    on<GetUserProfile>(_getUserProfile);
  }

  Future<void> _getUserProfile(
      GetUserProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    final result = await socialUseCase.getUser(uid: uid);
    result.fold(
        (error) => emit(state.copyWith(profileStatus: ProfileStatus.error)),
        (data) => emit(state.copyWith(
            userModel: data, profileStatus: ProfileStatus.loaded)));
  }

  void changedStatus(ChangedStatus event, Emitter<ProfileState> emit) {
    emit(state.copyWith(status: event.status));
  }

  void changedPost(ChangedPost event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(postStatus: PostStatus.loading));
    final uid =
        await socialUseCase.sharedPreference.get(SharedPreference.uidAccount);
    final result =
        await socialUseCase.updatePost(uid: uid, imageFile: event.file);
    result.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(postStatus: PostStatus.loaded),
      ),
    );
  }
}
