import 'package:firebase_demo_app/data/common/data.mapper.dart';
import 'package:firebase_demo_app/data/registration/dtos/registration_data_dto.dart';
import 'package:firebase_demo_app/domain/registration/models/registration_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegistrationDataDtoMapper implements DataMapper<RegistrationData, RegistrationDataDto> {
  @override
  RegistrationDataDto call(RegistrationData data) {
    return RegistrationDataDto(data.email, data.password);
  }
}
