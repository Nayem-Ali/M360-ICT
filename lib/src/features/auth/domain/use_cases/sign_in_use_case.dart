import 'package:firebase_auth/firebase_auth.dart';
import 'package:m360_ict/src/core/use_case/base_use_case.dart';
import 'package:m360_ict/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:m360_ict/src/features/auth/domain/dto/auth_dto.dart';
import 'package:m360_ict/src/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';

class SignInUseCase extends UseCase<UserCredential?, AuthDto> {
  AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  @override
  Future<UserCredential?> call(AuthDto params) async {
    return await authRepository.userSignIn(email: params.email, password: params.password);
  }
}
