import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  final int counterIndex;

  const CounterEvent(this.counterIndex);

  @override
  List<Object> get props => [counterIndex];
}

class IncrementCounter extends CounterEvent {
  const IncrementCounter(int index) : super(index);
}

class DecrementCounter extends CounterEvent {
  const DecrementCounter(int index) : super(index);
}

