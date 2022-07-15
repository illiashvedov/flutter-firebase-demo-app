import 'package:firebase_demo_app/domain/registration/models/registration_data.dart';
import 'package:firebase_demo_app/domain/registration/models/registration_response.dart';

abstract class RegistrationRepository {
  Future<RegistrationResponse> register(RegistrationData data);
}
