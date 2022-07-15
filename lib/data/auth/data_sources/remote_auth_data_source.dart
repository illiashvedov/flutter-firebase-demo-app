import 'package:firebase_demo_app/data/auth/dtos/auth_info_dto.dart';

abstract class RemoteAuthDataSource {
  Future<AuthInfoDto?> getAuthInfo();

  Future<AuthInfoDto> signIn(String email, String password);

  Future<void> logOut();
}
