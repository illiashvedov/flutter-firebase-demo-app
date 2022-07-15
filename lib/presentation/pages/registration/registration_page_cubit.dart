import 'package:equatable/equatable.dart';
import 'package:firebase_demo_app/domain/errors/app_exception.dart';
import 'package:firebase_demo_app/domain/registration/errors/registration_exceptions.dart';
import 'package:firebase_demo_app/domain/registration/models/registration_data.dart';
import 'package:firebase_demo_app/domain/registration/use_cases/register_use_case.dart';
import 'package:firebase_demo_app/utils/error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part './registration_page_state.dart';

enum RegistrationFormFields { email, password, confirmPassword }

final _emailPattern = RegExp(
  r'^(?!(?:(?:\x22?\x5C[\x00-\x7E]\x22?)|(?:\x22?[^\x5C\x22]\x22?)){255,})(?!(?:(?:\x22?\x5C[\x00-\x7E]\x22?)|(?:\x22?[^\x5C\x22]\x22?)){65,}@)(?:(?:[\x21\x23-\x27\x2A\x2B\x2D\x2F-\x39\x3D\x3F\x5E-\x7E]+)|(?:\x22(?:[\x01-\x08\x0B\x0C\x0E-\x1F\x21\x23-\x5B\x5D-\x7F]|(?:\x5C[\x00-\x7F]))*\x22))(?:\.(?:(?:[\x21\x23-\x27\x2A\x2B\x2D\x2F-\x39\x3D\x3F\x5E-\x7E]+)|(?:\x22(?:[\x01-\x08\x0B\x0C\x0E-\x1F\x21\x23-\x5B\x5D-\x7F]|(?:\x5C[\x00-\x7F]))*\x22)))*@(?:(?:(?!.*[^.]{64,})(?:(?:(?:xn--)?[a-z0-9]+(?:-[a-z0-9]+)*\.){1,126}){1,}(?:(?:[a-z][a-z0-9]*)|(?:(?:xn--)[a-z0-9]+))(?:-[a-z0-9]+)*)|(?:\[(?:(?:IPv6:(?:(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){7})|(?:(?!(?:.*[a-f0-9][:\]]){7,})(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,5})?::(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,5})?)))|(?:(?:IPv6:(?:(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){5}:)|(?:(?!(?:.*[a-f0-9]:){5,})(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,3})?::(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,3}:)?)))?(?:(?:25[0-5])|(?:2[0-4][0-9])|(?:1[0-9]{2})|(?:[1-9]?[0-9]))(?:\.(?:(?:25[0-5])|(?:2[0-4][0-9])|(?:1[0-9]{2})|(?:[1-9]?[0-9]))){3}))\]))$',
  caseSensitive: false,
);

@injectable
class RegistrationPageCubit extends Cubit<RegistrationPageState> {
  static RegistrationPageCubit create() {
    return GetIt.instance.get<RegistrationPageCubit>().._init();
  }

  final RegisterUseCase _registerUseCase;

  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isLoading = false;

  Map<RegistrationFormFields, String?> _errors = {};

  RegistrationPageCubit(this._registerUseCase) : super(const RegistrationPageState.loading());

  void _init() {
    _emitLoadedState();
  }

  void setEmail(String value) {
    _resetFieldError(RegistrationFormFields.email);
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
      _errors[RegistrationFormFields.email] = res;
      _emitLoadedState();

      return;
    }
  }

  void setPassword(String value) {
    _resetFieldError(RegistrationFormFields.password);
    _password = value;
    _emitLoadedState();
  }

  Future<void> validatePassword() async {
    String? res;

    if (_password.isEmpty) {
      res = 'This field is required';
    }

    if (res != null) {
      _errors[RegistrationFormFields.password] = res;
      _emitLoadedState();

      return;
    }
  }

  void setConfirmPassword(String value) {
    _resetFieldError(RegistrationFormFields.confirmPassword);
    _confirmPassword = value;
    _emitLoadedState();
  }

  Future<void> validateConfirmPassword() async {
    String? res;

    if (_confirmPassword.isEmpty) {
      res = 'This field is required';
    } else if (_password.isNotEmpty && _confirmPassword != _password) {
      res = 'Passwords do not match';
    }

    if (res != null) {
      _errors[RegistrationFormFields.confirmPassword] = res;
      _emitLoadedState();

      return;
    }
  }

  Future<void> submit() async {
    _validate();

    if (_isValid) {
      _startLoading();

      try {
        final data = RegistrationData(
          email: _email,
          password: _password,
        );

        await _registerUseCase.call(data);

        emit(const RegistrationPageState.success());
      } on AppException catch (e) {
        emit(RegistrationPageState.error(e.toMessage()));
      } on RegistrationException catch (e) {
        emit(RegistrationPageState.error(e.toMessage()));
      } catch (e) {
        emit(RegistrationPageState.error(e));
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

  void _resetFieldError(RegistrationFormFields field) {
    _errors.remove(field);
  }

  bool get _isValid => _errors.values.every((element) => element == null);

  void _validate() {
    _errors = _validationErrors;
    _emitLoadedState();
  }

  Map<RegistrationFormFields, String?> get _validationErrors {
    final res = <RegistrationFormFields, String?>{};

    if (_email.isEmpty) {
      res[RegistrationFormFields.email] = 'This field is required';
    } else if (!_emailPattern.hasMatch(_email)) {
      res[RegistrationFormFields.email] = 'Is not email';
    }

    if (_password.isEmpty) {
      res[RegistrationFormFields.password] = 'This field is required';
    }

    if (_confirmPassword.isEmpty) {
      res[RegistrationFormFields.confirmPassword] = 'This field is required';
    } else if (_password.isNotEmpty && _confirmPassword != _password) {
      res[RegistrationFormFields.confirmPassword] = 'Passwords do not match';
    }

    return res;
  }

  bool get _canSendData => _validationErrors.values.every((element) => element == null);

  void _emitLoadedState() {
    emit(
      RegistrationPageState.idle(
        email: _email,
        password: _password,
        confirmPassword: _confirmPassword,
        isLoading: _isLoading,
        errors: _errors,
        canSendData: _canSendData,
      ),
    );
  }
}
