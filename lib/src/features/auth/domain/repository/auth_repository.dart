import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential?> userSignIn({required String email, required String password});
  Future<UserCredential?> userSignUp({required String email, required String password});
  Future<UserCredential?> signWithGoogle();
}