import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package:firebase_demo_app/application.dart';
import 'package:firebase_demo_app/core/app.env.dart';
import 'package:firebase_demo_app/core/di/injection_container.dart';
import 'package:firebase_demo_app/firebase_options.dart';

final _getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(_getIt, AppEnv.name);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(Application());
}
