import 'package:clean_architecture/data/datasources/datalocal/shared_preferences_data.dart';
import 'package:clean_architecture/data/datasources/dataremote/remote_data_source.dart';
import 'package:clean_architecture/data/repositories/weather_repository_impl.dart';
import 'package:clean_architecture/domain/repositories/weather_repository.dart';
import 'package:clean_architecture/domain/usecases/social_usecase.dart';
import 'package:clean_architecture/domain/usecases/topics_usecase.dart';
import 'package:clean_architecture/domain/usecases/weather_usecase.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_bloc.dart';
import 'package:clean_architecture/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture/presentation/pages/detailtopics/detail_view_model.dart';
import 'package:clean_architecture/presentation/pages/home/home_view_model.dart';
import 'package:clean_architecture/presentation/pages/search/search_view_model.dart';
import 'package:clean_architecture/presentation/pages/settings/settings_view_model.dart';
import 'package:clean_architecture/presentation/pages/tab/tab_view_model.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // UseCase
  sl.registerLazySingleton(() => WeatherUseCase(sl()));
  sl.registerLazySingleton(() => TopicsUseCase(sl()));
  sl.registerLazySingleton(() => SocialUseCase(sl(), sl()));

  //Repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(remoteDataSource: sl()));

  //Data source
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  //viewModel
  sl.registerFactory(() => HomeVM(sl(), sl()));
  sl.registerFactory(() => SettingsVM(sl()));
  sl.registerFactory(() => DetailVM());
  sl.registerFactory(() => TabVM(sl()));
  sl.registerFactory(() => SearchVM(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => AuthBloc(sl()));

  //SharedPerence
  sl.registerLazySingleton<SharedPreference>(() => SharedPreferenceImpl());
}
