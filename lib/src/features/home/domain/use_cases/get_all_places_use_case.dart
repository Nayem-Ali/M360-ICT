import 'package:m360_ict/src/core/use_case/base_use_case.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';
import 'package:m360_ict/src/features/home/domain/repository/home_repository.dart';

class GetAllPlacesUseCase extends UseCase<List<Place>, NoParams>{
  HomeRepository homeRepository;

  GetAllPlacesUseCase(this.homeRepository);
  @override
  Future<List<Place>> call(NoParams params) async {
    return await homeRepository.getAllPlaces();
  }

}