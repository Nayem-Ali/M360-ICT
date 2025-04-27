import 'package:m360_ict/src/core/utils/logger/logger.dart';

class Place {
  final int id;
  final String placeName;
  final String carbonEmissionCondition;
  final String carbonEmissionRate;
  final String carbonEmissionChanged;
  final String carbonEmissionStatus;
  final int totalPeoples;
  final List<String> peopleImage;
  final List<History> history;

  Place({
    required this.id,
    required this.placeName,
    required this.carbonEmissionCondition,
    required this.carbonEmissionRate,
    required this.carbonEmissionChanged,
    required this.carbonEmissionStatus,
    required this.totalPeoples,
    required this.peopleImage,
    required this.history,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    // debug(json['peopleImage'].runtimeType);
    return Place(
      id: json['id'],
      placeName: json['placeName'],
      carbonEmissionCondition: json['carbonEmissionCondition'],
      carbonEmissionRate: json['carbonEmissionRate'],
      carbonEmissionChanged: json['carbonEmissionChanged'],
      carbonEmissionStatus: json['carbonEmissionStatus'],
      totalPeoples: json['totalPeoples'],
      peopleImage: (json['peopleImage'] as List).map((e) => e.toString()).toList(),
      history: (json['history'] as List).map((e) => History.fromJson(e)).toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'placeName': placeName,
      'carbonEmissionCondition': carbonEmissionCondition,
      'carbonEmissionRate': carbonEmissionRate,
      'carbonEmissionChanged': carbonEmissionChanged,
      'carbonEmissionStatus': carbonEmissionStatus,
      'totalPeoples': totalPeoples,
      'peopleImage': peopleImage,
    };
  }
}

class History{
  int id;
  String date;
  double rate;

  History({required this.id, required this.date, required this.rate});

  factory History.fromJson(Map<String, dynamic> json){
    return History(
      id: json['id'],
      date: json['date'],
      rate: json['rate']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "date": date,
      "rate": rate,
    };
  }
}
