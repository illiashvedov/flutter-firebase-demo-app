import 'package:equatable/equatable.dart';

abstract class AppException implements Exception, Equatable {
  const factory AppException.unknown() = AppExceptionUnknown;

  const factory AppException.incorrectData() = AppExceptionIncorrectData;
}

class AppExceptionUnknown implements AppException {
  const AppExceptionUnknown();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class AppExceptionIncorrectData implements AppException {
  const AppExceptionIncorrectData();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
