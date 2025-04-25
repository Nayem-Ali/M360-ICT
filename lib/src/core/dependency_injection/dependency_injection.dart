import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:m360_ict/firebase_options.dart';
import 'package:m360_ict/src/core/database/remote/firebase_handler.dart';
import 'package:m360_ict/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:m360_ict/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:m360_ict/src/features/auth/domain/repository/auth_repository.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_bloc.dart';

final GetIt sl = GetIt.I;

Future<void> serviceLocator() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseHandler.firebaseAuth);
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl()));
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(sl()));
  sl.registerFactory(() => AuthBloc(signInUseCase: sl(), signUpUseCase: sl()));
  await sl.allReady();
}
