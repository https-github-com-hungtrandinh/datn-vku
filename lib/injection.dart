import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:clean_architecture/data/datasources/dataremote/remote_api_recommender.dart';
import 'package:clean_architecture/data/datasources/dataremote/remote_firebase_auth.dart';
import 'package:clean_architecture/data/datasources/dataremote/remote_firebase_cloud.dart';
import 'package:clean_architecture/data/datasources/dataremote/remote_impl/remote_api_recommender_impl.dart';
import 'package:clean_architecture/domain/usecases/social_usecase.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_bloc.dart';
import 'package:clean_architecture/presentation/bloc/login/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/dataremote/remote_impl/remote_firebase_cloud_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // UseCase
  sl.registerLazySingleton(() => SocialUseCase(sl(), sl(),sl(), sl()));

  //FirebaseCloud
  sl.registerLazySingleton<RemoteFireBaseCloud>(() => RemoteFirebaseCloudImpl());

  //Data source
  sl.registerLazySingleton<RemoteFirebaseAuth>(() => RemoteFirebaseAuthImpl());

  //RecommenderApi
  sl.registerLazySingleton<RemoteApiRecommender>(() => RemoteApiRecommenderImpl());

  //viewModel
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => AuthBloc(sl(),sl()));


  //SharedPerence
  sl.registerLazySingleton<SharedPreference>(() => SharedPreferenceImpl());
}
