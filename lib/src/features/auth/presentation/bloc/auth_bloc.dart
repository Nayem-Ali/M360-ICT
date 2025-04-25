import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc({required this.signInUseCase, required this.signUpUseCase}) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
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
}
