import 'dart:async';

import 'package:firebase_demo_app/domain/auth/models/auth_info.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@lazySingleton
class AuthInfoBroadcaster {
  final _controller = BehaviorSubject<AuthInfo>();

  Stream<AuthInfo> get getAuthInfoStream => _controller.stream;

  void updateAuthInfo(AuthInfo authInfo) => _controller.add(authInfo);
}
