import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_onIncrement);
    on<DecrementCounter>(_onDecrement);
  }

  void _onIncrement(IncrementCounter event, Emitter<CounterState> emit) {
    final newCounters = List<int>.from(state.counters);
    if(event.counterIndex == 2){
      newCounters[event.counterIndex]+=100;
    } else{
      newCounters[event.counterIndex]++;
    }
    emit(state.copyWith(counters: newCounters));
  }

  void _onDecrement(DecrementCounter event, Emitter<CounterState> emit) {
    final newCounters = List<int>.from(state.counters);
    if (newCounters[event.counterIndex] > 0) {

      if(event.counterIndex == 2){
        newCounters[event.counterIndex]-=100;
      } else{
        newCounters[event.counterIndex]--;
      }
    }
    emit(state.copyWith(counters: newCounters));
  }
}
