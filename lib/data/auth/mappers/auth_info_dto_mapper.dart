import 'package:firebase_demo_app/data/auth/dtos/auth_info_dto.dart';
import 'package:firebase_demo_app/data/common/data.mapper.dart';
import 'package:firebase_demo_app/domain/auth/models/auth_info.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInfoDtoMapper implements DataMapper<AuthInfoDto, AuthInfo> {
  @override
  AuthInfo call(AuthInfoDto data) {
    return AuthInfo(userId: data.userId);
  }
}
