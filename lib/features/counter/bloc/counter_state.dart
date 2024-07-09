part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

abstract class CounterActionState extends CounterState{}

/// Used for bloc listener method TO SHOW SNACKBAR
class CounterShowSnackbarActionState extends CounterActionState{}

/// Used for bloc builder method TO INCREMENT COUNTER
class CounterIncrementState extends CounterState {
  final int val;

  CounterIncrementState({required this.val});
}

/// Used for bloc listener method TO INCREMENT COUNTER
class CounterIncrementActionState extends CounterState {}
