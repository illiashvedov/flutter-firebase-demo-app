import 'package:equatable/equatable.dart';
import 'package:firebase_demo_app/domain/auth/errors/auth_exceptions.dart';
import 'package:firebase_demo_app/domain/auth/use_cases/sign_in_use_case.dart';
import 'package:firebase_demo_app/domain/errors/app_exception.dart';
import 'package:firebase_demo_app/utils/error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part './login_page_state.dart';

enum LoginFormFields { email, password }

final _emailPattern = RegExp(
  r'^(?!(?:(?:\x22?\x5C[\x00-\x7E]\x22?)|(?:\x22?[^\x5C\x22]\x22?)){255,})(?!(?:(?:\x22?\x5C[\x00-\x7E]\x22?)|(?:\x22?[^\x5C\x22]\x22?)){65,}@)(?:(?:[\x21\x23-\x27\x2A\x2B\x2D\x2F-\x39\x3D\x3F\x5E-\x7E]+)|(?:\x22(?:[\x01-\x08\x0B\x0C\x0E-\x1F\x21\x23-\x5B\x5D-\x7F]|(?:\x5C[\x00-\x7F]))*\x22))(?:\.(?:(?:[\x21\x23-\x27\x2A\x2B\x2D\x2F-\x39\x3D\x3F\x5E-\x7E]+)|(?:\x22(?:[\x01-\x08\x0B\x0C\x0E-\x1F\x21\x23-\x5B\x5D-\x7F]|(?:\x5C[\x00-\x7F]))*\x22)))*@(?:(?:(?!.*[^.]{64,})(?:(?:(?:xn--)?[a-z0-9]+(?:-[a-z0-9]+)*\.){1,126}){1,}(?:(?:[a-z][a-z0-9]*)|(?:(?:xn--)[a-z0-9]+))(?:-[a-z0-9]+)*)|(?:\[(?:(?:IPv6:(?:(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){7})|(?:(?!(?:.*[a-f0-9][:\]]){7,})(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,5})?::(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,5})?)))|(?:(?:IPv6:(?:(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){5}:)|(?:(?!(?:.*[a-f0-9]:){5,})(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,3})?::(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,3}:)?)))?(?:(?:25[0-5])|(?:2[0-4][0-9])|(?:1[0-9]{2})|(?:[1-9]?[0-9]))(?:\.(?:(?:25[0-5])|(?:2[0-4][0-9])|(?:1[0-9]{2})|(?:[1-9]?[0-9]))){3}))\]))$',
  caseSensitive: false,
);

@injectable
class LoginPageCubit extends Cubit<LoginPageState> {
  static LoginPageCubit create() {
    return GetIt.instance.get<LoginPageCubit>().._init();
  }

  final SignInUseCase _signInUseCase;

  String _email = '';
  String _password = '';
  bool _isLoading = false;

  Map<LoginFormFields, String?> _errors = {};

  LoginPageCubit(this._signInUseCase) : super(const LoginPageState.loading());

  void _init() {
    _emitLoadedState();
  }

  void setEmail(String value) {
    _resetFieldError(LoginFormFields.email);
    _email = value;
    _emitLoadedState();
  }

  Future<void> validateEmail() async {
    String? res;

    if (_email.isEmpty) {
      res = 'This field is required';
    } else if (!_emailPattern.hasMatch(_email)) {
      res = 'Is not email';
    }

    if (res != null) {
      _errors[LoginFormFields.email] = res;
      _emitLoadedState();

      return;
    }
  }

  void setPassword(String value) {
    _resetFieldError(LoginFormFields.password);
    _password = value;
    _emitLoadedState();
  }

  Future<void> validatePassword() async {
    String? res;

    if (_password.isEmpty) {
      res = 'This field is required';
    }

    if (res != null) {
      _errors[LoginFormFields.password] = res;
      _emitLoadedState();

      return;
    }
  }

  Future<void> submit() async {
    _validate();

    if (_isValid) {
      _startLoading();

      try {
        await _signInUseCase.call(_email, _password);

        emit(const LoginPageState.success());
      } on AppException catch (e) {
        emit(LoginPageState.error(e.toMessage()));
      } on AuthException catch (e) {
        emit(LoginPageState.error(e.toMessage()));
      } catch (e) {
        emit(LoginPageState.error(e));
      }

      _stopLoading();
    }

    _emitLoadedState();
  }

  void _startLoading() {
    _isLoading = true;
    _emitLoadedState();
  }

  void _stopLoading() {
    _isLoading = false;
    _emitLoadedState();
  }

  void _resetFieldError(LoginFormFields field) {
    _errors.remove(field);
  }

  bool get _isValid => _errors.values.every((element) => element == null);

  void _validate() {
    _errors = _validationErrors;
    _emitLoadedState();
  }

  Map<LoginFormFields, String?> get _validationErrors {
    final res = <LoginFormFields, String?>{};

    if (_email.isEmpty) {
      res[LoginFormFields.email] = 'This field is required';
    } else if (!_emailPattern.hasMatch(_email)) {
      res[LoginFormFields.email] = 'Is not email';
    }

    if (_password.isEmpty) {
      res[LoginFormFields.password] = 'This field is required';
    }

    return res;
  }

  bool get _canSendData => _validationErrors.values.every((element) => element == null);

  void _emitLoadedState() {
    emit(
      LoginPageState.idle(
        email: _email,
        password: _password,
        isLoading: _isLoading,
        errors: _errors,
        canSendData: _canSendData,
      ),
    );
  }
}
