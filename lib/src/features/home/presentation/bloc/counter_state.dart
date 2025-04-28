import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final List<int> counters;

  const CounterState({this.counters = const [0, 0, 0, 0, 0, 0, 0, 0]});

  CounterState copyWith({List<int>? counters}) {
    return CounterState(counters: counters ?? this.counters);
  }

  @override
  List<Object> get props => [counters];
}