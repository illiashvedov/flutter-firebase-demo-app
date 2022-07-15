part of './login_page_cubit.dart';

abstract class LoginPageState implements Equatable {
  const factory LoginPageState.error(e) = LoginPageErrorState;

  const factory LoginPageState.loading() = LoginPageLoadingState;

  const factory LoginPageState.success() = LoginPageSuccessState;

  const factory LoginPageState.idle({
    required String email,
    required String password,
    required bool isLoading,
    required Map<LoginFormFields, String?> errors,
    required bool canSendData,
  }) = LoginPageIdleState;
}

class LoginPageErrorState implements LoginPageState {
  final dynamic e;

  const LoginPageErrorState(this.e);

  @override
  List<Object?> get props => [e];

  @override
  bool? get stringify => true;
}

class LoginPageLoadingState implements LoginPageState {
  const LoginPageLoadingState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class LoginPageSuccessState implements LoginPageState {
  const LoginPageSuccessState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class LoginPageIdleState implements LoginPageState {
  final String email;
  final String password;
  final bool isLoading;
  final Map<LoginFormFields, String?> errors;
  final bool canSendData;

  const LoginPageIdleState({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.errors,
    required this.canSendData,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        isLoading,
        errors,
        canSendData,
      ];

  @override
  bool? get stringify => true;
}
