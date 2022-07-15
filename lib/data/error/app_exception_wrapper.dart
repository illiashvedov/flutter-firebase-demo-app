import 'package:firebase_demo_app/domain/errors/app_exception.dart';

class AppExceptionWrapper implements Exception {
  final AppException appException;
  final Exception originalException;

  AppExceptionWrapper(this.appException, this.originalException);
}
