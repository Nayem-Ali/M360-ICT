import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';

class HomeRemoteDataSource {
  Future<List<Place>> getAllPlaces() async {
    try {
      String jsonString = await rootBundle.loadString("assets/json/places.json");
      final response = jsonDecode(jsonString);
      List<Place> places = (response['data'] as List)
          .map((json) => Place.fromJson(json as Map<String, dynamic>))
          .toList();
      return places;
    } catch (e) {
      debug(e);
      return [];
    }
  }
}
