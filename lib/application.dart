import 'package:firebase_demo_app/presentation/pages/home/home_page.dart';
import 'package:firebase_demo_app/presentation/routing/app.router.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
