import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';

import '../../../../../core/database/remote/firebase_handler.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSource(this.firebaseAuth);

  Future<UserCredential?> userSignUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (authError) {
      debug(authError.message);

    } catch (e) {
      debug(e);
    }
    return null;
  }

  Future<UserCredential?> userSignIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (authError) {
      debug(authError.message);

    } catch (e) {
      debug(e);
    }
    return null;
  }
  Future<UserCredential?> signInWithGoogle() async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await firebaseAuth.signInWithCredential(credential);
    }
    catch (e) {
      debug(e);
    }
    return null;
  }
}
