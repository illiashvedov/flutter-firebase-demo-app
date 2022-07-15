part of './home_page_cubit.dart';

abstract class HomePageState implements Equatable {
  const factory HomePageState.error(e) = HomePageErrorState;

  const factory HomePageState.loading() = HomePageLoadingState;

  const factory HomePageState.success() = HomePageSuccessState;

  const factory HomePageState.idle() = HomePageIdleState;
}

class HomePageErrorState implements HomePageState {
  final dynamic e;

  const HomePageErrorState(this.e);

  @override
  List<Object?> get props => [e];

  @override
  bool? get stringify => true;
}

class HomePageLoadingState implements HomePageState {
  const HomePageLoadingState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class HomePageSuccessState implements HomePageState {
  const HomePageSuccessState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class HomePageIdleState implements HomePageState {
  const HomePageIdleState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
