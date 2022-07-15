import 'package:firebase_demo_app/domain/auth/models/auth_info.dart';

abstract class AuthRepository {
  Future<AuthInfo> signIn(String email, String password);

  Future<AuthInfo?> getAuthInfo();

  Future<void> logOut();
}
