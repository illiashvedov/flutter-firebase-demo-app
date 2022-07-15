import 'package:firebase_demo_app/data/registration/dtos/registration_data_dto.dart';
import 'package:firebase_demo_app/data/registration/dtos/registration_response_dto.dart';

abstract class RemoteRegistrationDataSource {
  Future<RegistrationResponseDto> register(RegistrationDataDto dataDto);
}
