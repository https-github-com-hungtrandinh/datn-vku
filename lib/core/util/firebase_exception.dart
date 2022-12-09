import '../value/strings.dart';

class FirebaseExceptionCustom implements Exception {
  final String messenger;

  const FirebaseExceptionCustom([this.messenger = Strings.excreption]);

  factory FirebaseExceptionCustom.errorSignUp(String code) {
    switch (code) {
      case "invalid-email":
        return const FirebaseExceptionCustom(Strings.invalidEmail);
      case 'user-disabled':
        return const FirebaseExceptionCustom(Strings.userDisabled);
      case 'email-already-in-use':
        return const FirebaseExceptionCustom(Strings.emailAlreadyInUse);
      case 'operation-not-allowed':
        return const FirebaseExceptionCustom(Strings.operationNotAllowed);
      case 'weak-password':
        return const FirebaseExceptionCustom(Strings.weakPassword);
      default:
        return const FirebaseExceptionCustom();
    }
  }

  factory FirebaseExceptionCustom.errorSignIn(String code) {
    switch (code) {
      case 'user-not-found':
        return const FirebaseExceptionCustom(Strings.emailEmpty);
      case 'wrong-password':
        return const FirebaseExceptionCustom(Strings.passwordEmpty);
      default:
        return const FirebaseExceptionCustom();
    }
  }
}
