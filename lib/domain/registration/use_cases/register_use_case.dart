import 'package:injectable/injectable.dart';

import 'package:firebase_demo_app/domain/registration/models/registration_data.dart';
import 'package:firebase_demo_app/domain/registration/models/registration_response.dart';
import 'package:firebase_demo_app/domain/registration/repositories/registration_repository.dart';

@injectable
class RegisterUseCase {
  final RegistrationRepository _registrationRepository;

  RegisterUseCase(this._registrationRepository);

  Future<RegistrationResponse> call(RegistrationData data) async {
    final response = await _registrationRepository.register(data);

    return response;
  }
}
