import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_app/data/registration/data_sources/remote_registration_data_source.dart';
import 'package:firebase_demo_app/data/registration/dtos/registration_data_dto.dart';
import 'package:firebase_demo_app/data/registration/dtos/registration_response_dto.dart';
import 'package:firebase_demo_app/domain/registration/errors/registration_exceptions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteRegistrationDataSource)
class RemoteRegistrationDataSourceImpl implements RemoteRegistrationDataSource {
  final FirebaseAuth _firebaseAuth;

  RemoteRegistrationDataSourceImpl(this._firebaseAuth);

  @override
  Future<RegistrationResponseDto> register(RegistrationDataDto dataDto) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: dataDto.email,
        password: dataDto.password,
      );

      return RegistrationResponseDto(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const RegistrationException.weakPassword();
      } else if (e.code == 'email-already-in-use') {
        throw const RegistrationException.emailAlreadyInUse();
      } else {
        throw const RegistrationException.unknown();
      }
    } catch (e) {
      rethrow;
    }
  }
}
