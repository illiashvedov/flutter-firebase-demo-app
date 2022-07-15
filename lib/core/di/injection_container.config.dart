// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/auth/data_sources/remote_auth_data_source.dart' as _i10;
import '../../data/auth/data_sources/remote_auth_data_source_impl.dart' as _i11;
import '../../data/auth/mappers/auth_info_dto_mapper.dart' as _i6;
import '../../data/auth/repositories/auth_repository_impl.dart' as _i15;
import '../../data/registration/data_sources/remote_registration_data_source.dart'
    as _i12;
import '../../data/registration/data_sources/remote_registration_data_source_impl.dart'
    as _i13;
import '../../data/registration/mappers/registration_data_dto_mapper.dart'
    as _i8;
import '../../data/registration/mappers/registration_response_dto_mapper.dart'
    as _i9;
import '../../data/registration/repositories/registration_repository_impl.dart'
    as _i19;
import '../../domain/auth/auth_info_broadcaster.dart' as _i5;
import '../../domain/auth/repositories/auth_repository.dart' as _i14;
import '../../domain/auth/use_cases/is_logged_use_case.dart' as _i16;
import '../../domain/auth/use_cases/log_out_use_case.dart' as _i17;
import '../../domain/auth/use_cases/sign_in_use_case.dart' as _i20;
import '../../domain/registration/repositories/registration_repository.dart'
    as _i18;
import '../../domain/registration/use_cases/register_use_case.dart' as _i24;
import '../../presentation/pages/entry/entry_page_cubit.dart' as _i21;
import '../../presentation/pages/home/home_page_cubit.dart' as _i22;
import '../../presentation/pages/login/login_page_cubit.dart' as _i23;
import '../../presentation/pages/registration/registration_page_cubit.dart'
    as _i25;
import '../../presentation/routing/app.router.dart' as _i4;
import '../app.env.dart' as _i3;
import 'env_module.dart' as _i26;
import 'firebase_module.dart' as _i27; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final envModule = _$EnvModule();
  final firebaseModule = _$FirebaseModule();
  gh.lazySingleton<_i3.AppEnv>(() => envModule.devEnv);
  gh.singleton<_i4.AppRouter>(_i4.AppRouter());
  gh.lazySingleton<_i5.AuthInfoBroadcaster>(() => _i5.AuthInfoBroadcaster());
  gh.factory<_i6.AuthInfoDtoMapper>(() => _i6.AuthInfoDtoMapper());
  gh.lazySingleton<_i7.FirebaseAuth>(() => firebaseModule.firebaseAuth);
  gh.factory<_i8.RegistrationDataDtoMapper>(
      () => _i8.RegistrationDataDtoMapper());
  gh.factory<_i9.RegistrationResponseDtoMapper>(
      () => _i9.RegistrationResponseDtoMapper());
  gh.lazySingleton<_i10.RemoteAuthDataSource>(
      () => _i11.RemoteAuthDataSourceImpl(get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i12.RemoteRegistrationDataSource>(
      () => _i13.RemoteRegistrationDataSourceImpl(get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i14.AuthRepository>(() => _i15.AuthRepositoryImpl(
      get<_i10.RemoteAuthDataSource>(), get<_i6.AuthInfoDtoMapper>()));
  gh.factory<_i16.IsLoggedUseCase>(
      () => _i16.IsLoggedUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i17.LogOutUseCase>(
      () => _i17.LogOutUseCase(get<_i14.AuthRepository>()));
  gh.lazySingleton<_i18.RegistrationRepository>(() =>
      _i19.RegistrationRepositoryImpl(
          get<_i12.RemoteRegistrationDataSource>(),
          get<_i8.RegistrationDataDtoMapper>(),
          get<_i9.RegistrationResponseDtoMapper>()));
  gh.factory<_i20.SignInUseCase>(
      () => _i20.SignInUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i21.EntryPageCubit>(
      () => _i21.EntryPageCubit(get<_i16.IsLoggedUseCase>()));
  gh.factory<_i22.HomePageCubit>(
      () => _i22.HomePageCubit(get<_i17.LogOutUseCase>()));
  gh.factory<_i23.LoginPageCubit>(
      () => _i23.LoginPageCubit(get<_i20.SignInUseCase>()));
  gh.factory<_i24.RegisterUseCase>(
      () => _i24.RegisterUseCase(get<_i18.RegistrationRepository>()));
  gh.factory<_i25.RegistrationPageCubit>(
      () => _i25.RegistrationPageCubit(get<_i24.RegisterUseCase>()));
  return get;
}

class _$EnvModule extends _i26.EnvModule {}

class _$FirebaseModule extends _i27.FirebaseModule {}
