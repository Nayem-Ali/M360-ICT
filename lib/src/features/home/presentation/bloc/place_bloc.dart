import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m360_ict/src/core/use_case/base_use_case.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';
import 'package:m360_ict/src/features/home/domain/use_cases/get_all_places_use_case.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/place_event.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final GetAllPlacesUseCase getAllPlacesUseCase;

  PlaceBloc(this.getAllPlacesUseCase) : super(PlaceInitialState()) {
    on<GetPlaceEvent>((event, emit) async {
      emit(PlaceLoadingState());
      final List<Place> response = await getAllPlacesUseCase.call(NoParams());
      if (response.isNotEmpty) {
        emit(PlaceSuccessState(places: response));
      } else {
        emit(PlaceFailureState());
      }
    });
  }
}
