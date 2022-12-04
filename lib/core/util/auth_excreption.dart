import '../value/strings.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  final String messenger;

  const SignUpWithEmailAndPasswordFailure(
      [this.messenger = Strings.excreption]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case "invalid-email":
        return const SignUpWithEmailAndPasswordFailure(Strings.invalidEmail);
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(Strings.userDisabled);
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(Strings.emailAlreadyInUse);
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(Strings.operationNotAllowed);
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(Strings.weakPassword);
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
