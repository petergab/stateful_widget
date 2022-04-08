import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._fakeRepository) : super(const HomeState());

  final FakeRepository _fakeRepository;

  Future<void> increment() async {
    emit(HomeState(
      number: state.number,
      isLoading: true,
    ));

    try {
      final result = await _fakeRepository.fetchData();
      emit(
        HomeState(
          number: state.number + 1,
          msg: result,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(HomeState(
        number: state.number,
        msg: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> decrement() async {
    emit(HomeState(
      number: state.number,
      isLoading: true,
    ));

    try {
      final result = await _fakeRepository.fetchData();
      emit(
        HomeState(
          number: state.number - 1,
          msg: result,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(HomeState(
        number: state.number,
        msg: e.toString(),
        isLoading: false,
      ));
    }
  }
}
