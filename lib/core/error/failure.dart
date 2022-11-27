import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../value/strings.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class SeverFailure extends Failure {
  const SeverFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class RequestTimeOut extends Failure {
  const RequestTimeOut(String message) : super(message);
}

Failure formatFailure(int? statusCode) {
  if (statusCode == 401) {
    return RequestTimeOut(Strings.inputError);
  } else if (statusCode == 404) {
    return RequestTimeOut(Strings.inputError);
  } else {
    return RequestTimeOut(Strings.inputError);
  }
}
