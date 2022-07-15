import 'package:injectable/injectable.dart';
import 'package:firebase_demo_app/domain/auth/repositories/auth_repository.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  const SignInUseCase(this._authRepository);

  Future<void> call(String email, String password) {
    return _authRepository.signIn(email, password);
  }
}
