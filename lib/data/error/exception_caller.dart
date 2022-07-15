import 'package:firebase_demo_app/data/error/app_exception_wrapper.dart';

Future<R> callWithExceptionWrapper<R>(Future<R> Function() call) async {
  try {
    return await call();
  } on AppExceptionWrapper catch (w) {
    throw w.appException;
  }
}
