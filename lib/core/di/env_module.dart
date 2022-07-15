import 'package:firebase_demo_app/core/app.env.dart';
import 'package:injectable/injectable.dart';

@module
abstract class EnvModule {
  @lazySingleton
  AppEnv get devEnv => const AppEnv();
}
