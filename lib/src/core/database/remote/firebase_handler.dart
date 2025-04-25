import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHandler {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static FirebaseAuth get firebaseAuth => _auth;
}