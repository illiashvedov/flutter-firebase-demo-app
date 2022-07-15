import 'package:firebase_demo_app/data/common/data.mapper.dart';
import 'package:firebase_demo_app/data/registration/dtos/registration_response_dto.dart';
import 'package:firebase_demo_app/domain/registration/models/registration_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegistrationResponseDtoMapper implements DataMapper<RegistrationResponseDto, RegistrationResponse> {
  @override
  RegistrationResponse call(RegistrationResponseDto data) {
    return RegistrationResponse(userId: data.userId);
  }
}
