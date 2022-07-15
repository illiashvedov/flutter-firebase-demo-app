import 'package:equatable/equatable.dart';

abstract class AuthException implements Exception, Equatable {
  const factory AuthException.unknown() = AuthExceptionUnknown;

  const factory AuthException.userNotFound() = AuthExceptionUserNotFound;

  const factory AuthException.wrongPassword() = AuthExceptionWrongPassword;
}

class AuthExceptionUnknown implements AuthException {
  const AuthExceptionUnknown();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class AuthExceptionUserNotFound implements AuthException {
  const AuthExceptionUserNotFound();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class AuthExceptionWrongPassword implements AuthException {
  const AuthExceptionWrongPassword();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
