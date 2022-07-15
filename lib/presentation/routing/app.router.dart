import 'package:auto_route/auto_route.dart';
import 'package:firebase_demo_app/presentation/pages/entry/entry_page.dart';
import 'package:firebase_demo_app/presentation/pages/home/home_page.dart';
import 'package:firebase_demo_app/presentation/pages/login/login_page.dart';
import 'package:firebase_demo_app/presentation/pages/registration/registration_page.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'app.router.gr.dart';

@singleton
@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: EntryPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegistrationPage),
    AutoRoute(page: HomePage),
  ],
)
class AppRouter extends _$AppRouter {}
