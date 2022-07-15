import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:firebase_demo_app/core/di/injection_container.config.dart';

@InjectableInit()
Future<void> configureDependencies(GetIt getIt, String env) async => $initGetIt(
      getIt,
      environment: env,
    );
