import 'package:firebase_auth/firebase_auth.dart';
import 'package:m360_ict/src/core/use_case/base_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/repository/auth_repository.dart';

class GoogleSignInUseCase extends UseCase<UserCredential?, NoParams> {
  AuthRepository authRepository;

  GoogleSignInUseCase(this.authRepository);

  @override
  Future<UserCredential?> call(NoParams noParams) async {
    return await authRepository.signWithGoogle();
  }
}