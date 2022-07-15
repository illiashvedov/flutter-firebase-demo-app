import 'package:firebase_demo_app/data/auth/data_sources/remote_auth_data_source.dart';
import 'package:firebase_demo_app/data/auth/mappers/auth_info_dto_mapper.dart';
import 'package:firebase_demo_app/data/error/exception_caller.dart';
import 'package:firebase_demo_app/domain/auth/models/auth_info.dart';
import 'package:firebase_demo_app/domain/auth/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final AuthInfoDtoMapper _authInfoDtoMapper;

  AuthRepositoryImpl(this._remoteAuthDataSource, this._authInfoDtoMapper);

  @override
  Future<AuthInfo?> getAuthInfo() async {
    final res = await callWithExceptionWrapper(() => _remoteAuthDataSource.getAuthInfo());

    if (res == null) {
      return null;
    }

    return _authInfoDtoMapper.call(res);
  }

  @override
  Future<AuthInfo> signIn(String email, String password) async {
    final res = await callWithExceptionWrapper(() => _remoteAuthDataSource.signIn(email, password));

    return _authInfoDtoMapper.call(res);
  }

  @override
  Future<void> logOut() async {
    await callWithExceptionWrapper(() => _remoteAuthDataSource.logOut());
  }
}
