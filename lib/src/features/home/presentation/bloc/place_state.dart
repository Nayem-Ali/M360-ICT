import 'package:equatable/equatable.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';

abstract class PlaceState extends Equatable{
  const PlaceState();
}

class PlaceInitialState extends PlaceState{
  @override
  List<Object?> get props => [];
}

class PlaceLoadingState extends PlaceState{
  @override
  List<Object?> get props => [];
}

class PlaceSuccessState extends PlaceState{
  final List<Place> places;

  const PlaceSuccessState({required this.places});
  @override
  List<Object?> get props => [];
}

class PlaceFailureState extends PlaceState{
  @override
  List<Object?> get props => [];
}