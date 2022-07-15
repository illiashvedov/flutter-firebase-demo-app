part of './registration_page_cubit.dart';

abstract class RegistrationPageState implements Equatable {
  const factory RegistrationPageState.error(e) = RegistrationPageErrorState;

  const factory RegistrationPageState.loading() = RegistrationPageLoadingState;

  const factory RegistrationPageState.success() = RegistrationPageSuccessState;

  const factory RegistrationPageState.idle({
    required String email,
    required String password,
    required String confirmPassword,
    required bool isLoading,
    required Map<RegistrationFormFields, String?> errors,
    required bool canSendData,
  }) = RegistrationPageIdleState;
}

class RegistrationPageErrorState implements RegistrationPageState {
  final dynamic e;

  const RegistrationPageErrorState(this.e);

  @override
  List<Object?> get props => [e];

  @override
  bool? get stringify => true;
}

class RegistrationPageLoadingState implements RegistrationPageState {
  const RegistrationPageLoadingState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class RegistrationPageSuccessState implements RegistrationPageState {
  const RegistrationPageSuccessState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class RegistrationPageIdleState implements RegistrationPageState {
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  final Map<RegistrationFormFields, String?> errors;
  final bool canSendData;

  const RegistrationPageIdleState({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.isLoading,
    required this.errors,
    required this.canSendData,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        isLoading,
        errors,
        canSendData,
      ];

  @override
  bool? get stringify => true;
}
