import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable{
  const AuthState();
}

class AuthInitial extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoading extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthSuccess extends AuthState{
  final UserCredential userCredential;

  const AuthSuccess({required this.userCredential});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthFailure extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}