import 'package:flutter_bloc/flutter_bloc.dart';

// part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(number: 0));

  void plus() => emit(CounterState(number: state.number + 2));

  void minus() => emit(CounterState(number: state.number - 1));
}

class CounterState {
  late final int number;

  CounterState({required this.number});
}
