import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m360_ict/src/core/use_case/base_use_case.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/google_sign_in_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GoogleSignInUseCase googleSignInUseCase;

  AuthBloc({required this.signInUseCase, required this.signUpUseCase, required this.googleSignInUseCase}) : super
(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
    on<GoogleSignInEvent>(_onGoogleSignIn );
  }

  void _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    UserCredential? cred = await signUpUseCase.call(event.authDto);
    if (cred == null) {
      emit(AuthFailure());
    } else {
      emit(AuthSuccess(userCredential: cred));
    }
    debug(cred);
  }

  void _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    UserCredential? cred = await signInUseCase.call(event.authDto);
    if (cred == null) {
      emit(AuthFailure());
    } else {
      emit(AuthSuccess(userCredential: cred));
    }
  }

  void _onGoogleSignIn(GoogleSignInEvent, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    UserCredential? cred = await googleSignInUseCase.call(NoParams());
    if (cred == null) {
      emit(AuthFailure());
    } else {
      emit(AuthSuccess(userCredential: cred));
    }
  }
}
