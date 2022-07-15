import 'package:equatable/equatable.dart';

abstract class RegistrationException implements Exception, Equatable {
  const factory RegistrationException.unknown() = RegistrationExceptionUnknown;

  const factory RegistrationException.weakPassword() = RegistrationExceptionWeakPassword;

  const factory RegistrationException.emailAlreadyInUse() = RegistrationExceptionEmailAlreadyInUse;
}

class RegistrationExceptionUnknown implements RegistrationException {
  const RegistrationExceptionUnknown();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class RegistrationExceptionWeakPassword implements RegistrationException {
  const RegistrationExceptionWeakPassword();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class RegistrationExceptionEmailAlreadyInUse implements RegistrationException {
  const RegistrationExceptionEmailAlreadyInUse();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
