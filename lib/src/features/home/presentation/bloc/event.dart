import 'package:equatable/equatable.dart';

abstract class PlaceEvent extends Equatable{
  const PlaceEvent();
}

class GetPlaceEvent extends PlaceEvent{
  @override
  List<Object?> get props => [];
}