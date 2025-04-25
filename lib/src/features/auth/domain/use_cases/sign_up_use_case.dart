import 'package:firebase_auth/firebase_auth.dart';
import 'package:m360_ict/src/core/dependency_injection/dependency_injection.dart';
import 'package:m360_ict/src/core/use_case/base_use_case.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';
import 'package:m360_ict/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:m360_ict/src/features/auth/domain/dto/auth_dto.dart';
import 'package:m360_ict/src/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase extends UseCase<UserCredential?, AuthDto> {
  AuthRepository authRepositoryImpl;

  SignUpUseCase(this.authRepositoryImpl);

  @override
  Future<UserCredential?> call(AuthDto params) async {
    debug(authRepositoryImpl);
    return await authRepositoryImpl.userSignUp(email: params.email, password: params.password);
  }
}
