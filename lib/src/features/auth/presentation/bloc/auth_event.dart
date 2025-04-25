import 'package:equatable/equatable.dart';
import 'package:m360_ict/src/features/auth/domain/dto/auth_dto.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();
}

class SignUpEvent extends AuthEvent{

  final AuthDto authDto;

  const SignUpEvent({required this.authDto});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignInEvent extends AuthEvent{
  final AuthDto authDto;

  const SignInEvent({required this.authDto});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}