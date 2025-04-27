import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable{
  const AuthState();
}

class AuthInitial extends AuthState{
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState{
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState{
  final UserCredential userCredential;

  const AuthSuccess({required this.userCredential});

  @override
  List<Object?> get props => [];
}

class AuthFailure extends AuthState{
  @override
  List<Object?> get props => [];

}