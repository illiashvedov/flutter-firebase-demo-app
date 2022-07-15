import 'package:injectable/injectable.dart';

class AppEnv {
  static const String name = String.fromEnvironment('ENV', defaultValue: Environment.dev);

  const AppEnv();
}
