import 'package:firebase_auth/firebase_auth.dart';
import 'package:m360_ict/src/core/database/remote/firebase_handler.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';
import 'package:m360_ict/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<UserCredential?> userSignIn({required String email, required String password}) async {
    debug("Email: $email");
    return await authRemoteDataSource.userSignIn(email: email, password: password);
  }

  @override
  Future<UserCredential?> userSignUp({required String email, required String password}) async {
    debug("Email: $email");
    return await authRemoteDataSource.userSignUp(email: email, password: password);
  }
}
