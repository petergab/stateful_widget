part of 'home_cubit.dart';

@immutable
class HomeState {
  final int number;
  final String? msg;
  final bool isLoading;

  const HomeState({
    this.number = 1,
    this.msg,
    this.isLoading = false,
  });

  HomeState copyWith({
    int? number,
    String? msg,
    bool? isLoading,
  }) {
    return HomeState(
      number: number ?? this.number,
      msg: msg ?? this.msg,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
