import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repositories/fake_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._fakeRepository) : super(const HomeState());

  final FakeRepository _fakeRepository;

  Future<void> increment() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    try {
      final result = await _fakeRepository.fetchData();
      emit(
        state.copyWith(
          number: state.number + 1,
          msg: result,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        msg: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> decrement() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    try {
      final result = await _fakeRepository.fetchData();
      emit(
        state.copyWith(
          number: state.number - 1,
          msg: result,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        msg: e.toString(),
        isLoading: false,
      ));
    }
  }
}
