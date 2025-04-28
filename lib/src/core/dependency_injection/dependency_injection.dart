import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:m360_ict/firebase_options.dart';
import 'package:m360_ict/src/core/database/remote/firebase_handler.dart';
import 'package:m360_ict/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:m360_ict/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:m360_ict/src/features/auth/domain/repository/auth_repository.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/google_sign_in_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/counter_bloc.dart';
import 'package:m360_ict/src/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:m360_ict/src/features/home/data/repository/home_repository_impl.dart';
import 'package:m360_ict/src/features/home/domain/repository/home_repository.dart';
import 'package:m360_ict/src/features/home/domain/use_cases/get_all_places_use_case.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/place_bloc.dart';

final GetIt sl = GetIt.I;

Future<void> serviceLocator() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Auth
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseHandler.firebaseAuth);
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl()));
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(sl()));
  sl.registerLazySingleton<GoogleSignInUseCase>(() => GoogleSignInUseCase(sl()));
  sl.registerFactory(() => AuthBloc(signInUseCase: sl(), signUpUseCase: sl(), googleSignInUseCase: sl()));

  /// Home
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource());
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerLazySingleton<GetAllPlacesUseCase>(() => GetAllPlacesUseCase(sl()));
  sl.registerFactory(() => PlaceBloc(sl()));
  sl.registerFactory(() => CounterBloc());


  await sl.allReady();
}
