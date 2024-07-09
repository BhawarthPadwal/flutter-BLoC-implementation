import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    /// create a method that will execute the function on event
    /// occurs and emits the state

    on<CounterIncrementEvent>(counterIncrementEvent);

    on<CounterShowSnackbarEvent>(counterShowSnackbarEvent);
  }

  int value = 0;

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) {
    value = value + 1;

    emit(CounterIncrementState(val: value));
  }

  FutureOr<void> counterShowSnackbarEvent(
      CounterShowSnackbarEvent event, Emitter<CounterState> emit) {
    emit(CounterShowSnackbarActionState());
  }

  /// Used below function when we tried while executing counter
/// increment using Bloc Listener
  /*FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterIncrementActionState());
  }*/
}
