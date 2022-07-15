import 'package:equatable/equatable.dart';
import 'package:firebase_demo_app/domain/auth/use_cases/log_out_use_case.dart';
import 'package:firebase_demo_app/domain/errors/app_exception.dart';
import 'package:firebase_demo_app/utils/error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part './home_page_state.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  static HomePageCubit create() {
    return GetIt.instance.get<HomePageCubit>();
  }

  final LogOutUseCase _logOutUseCase;

  HomePageCubit(this._logOutUseCase) : super(const HomePageState.idle());

  Future<void> logOut() async {
    try {
      emit(const HomePageState.loading());

      await _logOutUseCase();

      emit(const HomePageState.success());
    } on AppException catch (e) {
      emit(HomePageState.error(e.toMessage()));
      rethrow;
    } catch (e) {
      emit(HomePageState.error(e));
      rethrow;
    }
  }
}
