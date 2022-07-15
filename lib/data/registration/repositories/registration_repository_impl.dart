import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_app/data/error/exception_caller.dart';
import 'package:firebase_demo_app/data/registration/data_sources/remote_registration_data_source.dart';
import 'package:firebase_demo_app/data/registration/mappers/registration_data_dto_mapper.dart';
import 'package:firebase_demo_app/data/registration/mappers/registration_response_dto_mapper.dart';
import 'package:firebase_demo_app/domain/registration/models/registration_data.dart';
import 'package:firebase_demo_app/domain/registration/models/registration_response.dart';
import 'package:firebase_demo_app/domain/registration/repositories/registration_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  final RemoteRegistrationDataSource _remoteRegistrationDataSource;
  final RegistrationDataDtoMapper _registrationDataDtoMapper;
  final RegistrationResponseDtoMapper _registrationResponseDtoMapper;

  RegistrationRepositoryImpl(
    this._remoteRegistrationDataSource,
    this._registrationDataDtoMapper,
    this._registrationResponseDtoMapper,
  );

  @override
  Future<RegistrationResponse> register(RegistrationData data) async {
    final dto = _registrationDataDtoMapper.call(data);

    final res = await callWithExceptionWrapper(() => _remoteRegistrationDataSource.register(dto));

    return _registrationResponseDtoMapper.call(res);
  }
}
