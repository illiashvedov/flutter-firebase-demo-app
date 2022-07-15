part of 'entry_page_cubit.dart';

abstract class EntryPageState implements Equatable {
  const factory EntryPageState.error(e) = EntryPageErrorState;

  const factory EntryPageState.loading() = EntryPageLoadingState;

  const factory EntryPageState.loggedOut() = EntryPageLoggedOutState;

  const factory EntryPageState.logged() = EntryPageLoggedState;
}

class EntryPageErrorState implements EntryPageState {
  final dynamic e;

  const EntryPageErrorState(this.e);

  @override
  List<Object?> get props => [e];

  @override
  bool? get stringify => true;
}

class EntryPageLoadingState implements EntryPageState {
  const EntryPageLoadingState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class EntryPageLoggedOutState implements EntryPageState {
  const EntryPageLoggedOutState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class EntryPageLoggedState implements EntryPageState {
  const EntryPageLoggedState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
