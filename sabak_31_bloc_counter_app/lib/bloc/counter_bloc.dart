import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(InitialState()) {
    on<NumberIncreaseEvent>(onNumberIncrease);
    on<NumberDecreaseEvent>(onNumberDecrease);
  }
  void onNumberIncrease(
      NumberIncreaseEvent event, Emitter<CounterState> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter: counter));
  }

  void onNumberDecrease(
      NumberDecreaseEvent event, Emitter<CounterState> emit) async {
    counter = counter - 1;
    emit(UpdateState(counter: counter));
  }
}
