import 'package:firebase_demo_app/domain/auth/errors/auth_exceptions.dart';
import 'package:firebase_demo_app/domain/errors/app_exception.dart';
import 'package:firebase_demo_app/domain/registration/errors/registration_exceptions.dart';

extension AppExceptionConverter on AppException {
  String toMessage() {
    switch (runtimeType) {
      case AppExceptionIncorrectData:
        return 'Incorrect data error';
      default:
        return 'Unknown error';
    }
  }
}

extension RegistrationExceptionConverter on RegistrationException {
  String toMessage() {
    switch (runtimeType) {
      case RegistrationExceptionWeakPassword:
        return 'The password provided is too weak';
      case RegistrationExceptionEmailAlreadyInUse:
        return 'The account already exists for that email';
      default:
        return 'Unknown error';
    }
  }
}

extension AuthExceptionConverter on AuthException {
  String toMessage() {
    switch (runtimeType) {
      case AuthExceptionUserNotFound:
        return 'No user found for that email';
      case AuthExceptionWrongPassword:
        return 'Wrong password provided for that user';
      default:
        return 'Unknown error';
    }
  }
}
