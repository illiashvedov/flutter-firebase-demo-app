import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_app/data/auth/data_sources/remote_auth_data_source.dart';
import 'package:firebase_demo_app/data/auth/dtos/auth_info_dto.dart';
import 'package:firebase_demo_app/domain/auth/errors/auth_exceptions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final FirebaseAuth _firebaseAuth;

  RemoteAuthDataSourceImpl(this._firebaseAuth);

  @override
  Future<AuthInfoDto?> getAuthInfo() async {
    final authUser = _firebaseAuth.currentUser;

    if (authUser == null) {
      return null;
    }

    return AuthInfoDto(authUser.uid);
  }

  @override
  Future<AuthInfoDto> signIn(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return AuthInfoDto(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const AuthException.userNotFound();
      } else if (e.code == 'wrong-password') {
        throw const AuthException.wrongPassword();
      } else {
        throw const AuthException.unknown();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
