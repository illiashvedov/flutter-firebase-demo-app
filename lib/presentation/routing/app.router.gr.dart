// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    EntryRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const EntryPage(),
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const LoginPage(),
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const RegistrationPage(),
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(EntryRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(RegistrationRoute.name, path: '/registration-page'),
        RouteConfig(HomeRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [EntryPage]
class EntryRoute extends PageRouteInfo<void> {
  const EntryRoute() : super(EntryRoute.name, path: '/');

  static const String name = 'EntryRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute()
      : super(RegistrationRoute.name, path: '/registration-page');

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}
