import 'package:m360_ict/src/features/home/data/model/place_model.dart';

abstract class HomeRepository{
  Future<List<Place>> getAllPlaces();
}