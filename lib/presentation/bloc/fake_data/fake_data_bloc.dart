

import 'dart:math';

import 'package:clean_architecture/data/models/firebase/like.dart';
import 'package:clean_architecture/data/models/firebase/view.dart';
import 'package:clean_architecture/presentation/bloc/fake_data/fake_data_event.dart';
import 'package:clean_architecture/presentation/bloc/fake_data/fake_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/location.dart';
import '../../../data/models/firebase/location.dart';
import '../../../domain/usecases/social_usecase.dart';

class FakeDataBloc extends Bloc<FakeDataEvent, FakeDataState> {
  SocialUseCase socialUseCase;

  FakeDataBloc(this.socialUseCase) : super(FakeDataState.initial()) {
    on<CreateDataFake>(createData);
  }

  void createData(CreateDataFake event, Emitter<FakeDataState> emit) async {
    for (int i = 269; i <350 ; i++) {
      final listGender = ["Male", "Female"];
      var listMajor = [
        'dentist',
        'waiter',
        "gardener",
        "builder",
        "artist",
        "businessman",
        "reporter",
        "singer",
        "carpenter",
        "baker",
        "farmer",
        "developer",
        "doctor",
        "dancer",
        "magician",
        "teacher",
        "policeman",
        "cashier",
        "cook",
        "secretary",
        "nurse",
        "tailor"
      ];
      var listAvatar = [
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Femily-studer-0gLGQBC9noc-unsplash.jpg?alt=media&token=e565adb3-1481-4db0-8983-ef2aa6d85f10",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fleohoho-s_Y20xq_8sk-unsplash.jpg?alt=media&token=8d2cf1f3-d954-49ee-b395-650524e5036d",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Ffarzin-yarahmadi-WFMfMxkL9zo-unsplash.jpg?alt=media&token=45793760-0fc4-4b54-85ea-ed9a05b21085",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Firina-iriser-T7SnfIWd_Lc-unsplash.jpg?alt=media&token=deedd014-f91a-440b-9821-ac5a4957db9d",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fgood-faces-2eC_-0yRrGU-unsplash.jpg?alt=media&token=6afce22d-2fdd-4f11-b183-0dad15b7ad1c",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Ffabio-jock-xbrkcLR_WFU-unsplash.jpg?alt=media&token=03cdd9ee-ec88-4e25-b89f-ddcc19b01786",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fdharma-saputra-8SL9k6qbEEo-unsplash.jpg?alt=media&token=3393ec69-e294-4543-95de-493eb78361ef",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fanthony-tran-2F7w4MiVVjo-unsplash.jpg?alt=media&token=136df9ce-4722-42a5-a905-09ccecf4a9ae",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fkyle-smith-tlowJ-oYAjU-unsplash.jpg?alt=media&token=dd9c6349-e519-48d9-9271-c1a772e07587",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fcharles-c-collingwood--kJ124FsqhI-unsplash.jpg?alt=media&token=7b223e9d-d0d1-4d99-ba3b-0fbe468d2e92",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fgirl-with-red-hat-oXfqLmJMQcQ-unsplash.jpg?alt=media&token=7bd9531a-f957-4bd2-878b-981b325274fa",
        "https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2Fomar-elsharawy-0urE8CCi-To-unsplash.jpg?alt=media&token=b42754fb-5e9e-4643-b24c-c4dbd5aa3d33"
      ];
      final random = Random();
      var elementMajor = listMajor[random.nextInt(listMajor.length)];
      var genderRandom = listGender[random.nextInt(listGender.length)];
      var avatarRandom = listAvatar[random.nextInt(listAvatar.length)];

      final result = await socialUseCase.registerWithEmailPassword(
          email: "test$i@gmail.com", password: "1111111");
      result.fold((l) => null, (r) => emit(state.copyWith(uid: r)));
      final location = await determinePosition();
      await socialUseCase.updateLocation(
          location: Location(lat: location.latitude, long: location.longitude),
          uid: state.uid);
      await socialUseCase.updateUserSelection(
          uid: state.uid,
          name: "test$i",
          birthday: DateTime.now(),
          major: elementMajor,
          gender: genderRandom,
          interests: ["Volleyball", "Cycling", "Football"],
          photoUrl: avatarRandom);
      final allUser = await socialUseCase.getAllUser(uid: state.uid);
      allUser.fold(
          (l) => null, (data) => {emit(state.copyWith(allUser: data))});

      for (int j = 0; j < 30; j++) {
        var idLike = random.nextInt(i-10);
        var idWatch = random.nextInt(i-10);
        var listId=[idWatch,idLike];
        var id = listId[random.nextInt(listId.length)];
        await socialUseCase.userLike(
            userLike: UserLike(
                uidLike: state.uid, uidLiked: [state.allUser![idLike].uid!]));
        await socialUseCase.userView(
            userView: UserView(
                myUidView: state.uid,
                uidOwenView: [state.allUser![id].uid!]));
      }
      print("donneeeeádádadsa");
    }
  }
}
