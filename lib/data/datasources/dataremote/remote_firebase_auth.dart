import 'package:clean_architecture/core/constants/key.dart';
import 'package:clean_architecture/data/models/account.dart';
import 'package:clean_architecture/data/models/post_all.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/util/firebase_exception.dart';
import '../../models/weather_dto.dart';

abstract class RemoteFirebaseAuth {
  Future<WeatherDto> getCurrentWeather(String cityName);

  Future<Account> login({required String email, required String password});

  Future<PostAll> getPostAll({required String token});

  Future<bool> checkAuth();

  Future<void> signInWithGoogle();

  Future<Account> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber});

  Future<Either<FirebaseExceptionCustom, String>> registerWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<FirebaseExceptionCustom, void>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class RemoteFirebaseAuthImpl implements RemoteFirebaseAuth {
  GoogleSignIn googleSign = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ConstApp.baseUrlHeroku,
      headers: {'Content-Type': 'application/json'}));

  @override
  Future<WeatherDto> getCurrentWeather(String cityName) async {
    const String url = "${ConstApp.baseUrl}topics";
    Response response =
        await _dio.get(url, queryParameters: {"client_id": ConstApp.keyApi});
    if (response.statusCode == 200) {
      return WeatherDto.fromJson(response.data);
    } else {
      throw Exception();
    }
  }


  @override
  Future<Account> login(
      {required String email, required String password}) async {
    final Map<String, dynamic> body = {"email": email, "password": password};
    Response response = await _dio.post(
      'v1/auth/login',
      data: body,
    );
    if (response.statusCode == 200) {
      return Account.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Account> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber}) async {
    final Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "name": userName,
      "gender": true,
      "phoneNumber": phoneNumber
    };
    Response response = await _dio.post("v1/auth/register", data: body);
    if (response.statusCode == 200) {
      return Account.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<PostAll> getPostAll({required String token}) async {
    Response response = await _dio.get(
      'post',
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );
    if (response.statusCode == 200) {
      return PostAll.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, String>> registerWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(result.user!.uid);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseExceptionCustom.errorSignUp(e.code));
    }
  }

  @override
  Future<bool> checkAuth() async {
    bool auth = false;
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        auth = false;
      } else {
        auth = true;
      }
    });
    return auth;
  }

  @override
  Future<Either<FirebaseExceptionCustom, void>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseExceptionCustom.errorSignIn(e.code));
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try{
     await googleSign.signIn();
      // if (googleSignInAccount != null) {
      //   GoogleSignInAuthentication googleSignInAuthentication =
      //   await googleSignInAccount.authentication;
      //
      //   AuthCredential credential = GoogleAuthProvider.credential(
      //     accessToken: googleSignInAuthentication.accessToken,
      //     idToken: googleSignInAuthentication.idToken,
      //   );
      //
      //   UserCredential authResult = await firebaseAuth.signInWithCredential(credential).catchError((onErr) => print(onErr));
      // }

    }on FirebaseException catch(e){

    }
  }
}
