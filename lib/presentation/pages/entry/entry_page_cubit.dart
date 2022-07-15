import 'package:equatable/equatable.dart';
import 'package:firebase_demo_app/domain/auth/use_cases/is_logged_use_case.dart';
import 'package:firebase_demo_app/domain/errors/app_exception.dart';
import 'package:firebase_demo_app/utils/error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part 'entry_page_state.dart';

@injectable
class EntryPageCubit extends Cubit<EntryPageState> {
  static EntryPageCubit create() {
    return GetIt.instance.get<EntryPageCubit>().._init();
  }

  final IsLoggedUseCase _isLoggedUseCase;

  EntryPageCubit(this._isLoggedUseCase) : super(const EntryPageState.loading());

  Future<void> _init() async {
    try {
      final isLogged = await _isLoggedUseCase();

      if (isLogged) {
        emit(const EntryPageState.logged());
      } else {
        emit(const EntryPageState.loggedOut());
      }
    } on AppException catch (e) {
      emit(EntryPageState.error(e.toMessage()));
      rethrow;
    } catch (e) {
      emit(EntryPageState.error(e));
      rethrow;
    }
  }
}
