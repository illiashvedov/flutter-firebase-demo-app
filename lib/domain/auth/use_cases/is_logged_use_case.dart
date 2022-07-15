import 'package:injectable/injectable.dart';

import 'package:firebase_demo_app/domain/auth/repositories/auth_repository.dart';

@injectable
class IsLoggedUseCase {
  final AuthRepository _repository;

  IsLoggedUseCase(this._repository);

  Future<bool> call() async {
    final token = await _repository.getAuthInfo();

    return token != null;
  }
}
