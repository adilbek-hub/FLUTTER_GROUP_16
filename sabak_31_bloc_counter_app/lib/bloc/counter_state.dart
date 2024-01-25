part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class InitialState extends CounterState {}

class UpdateState extends CounterState {
  UpdateState({required this.counter});
  final int counter;
}
