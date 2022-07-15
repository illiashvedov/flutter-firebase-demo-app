import 'package:injectable/injectable.dart';

import 'package:firebase_demo_app/domain/auth/repositories/auth_repository.dart';

@injectable
class LogOutUseCase {
  final AuthRepository _authRepository;

  LogOutUseCase(this._authRepository);

  Future<void> call() {
    return _authRepository.logOut();
  }
}
