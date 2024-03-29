import 'package:equatable/equatable.dart';

 abstract class Failure extends Equatable{
  final String message;
  const Failure( this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
class SeverFailure extends Failure{
  const SeverFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}
