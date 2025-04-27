import 'package:m360_ict/src/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';
import 'package:m360_ict/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<List<Place>> getAllPlaces() async {
    return await homeRemoteDataSource.getAllPlaces();
  }
}
