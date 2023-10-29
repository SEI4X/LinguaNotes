import 'package:equatable/equatable.dart';
import 'package:lingua_notes/core/usecase/usecase.dart';
import 'package:lingua_notes/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:lingua_notes/utils/typedef.dart';

class SignInByEmail extends UsecaseWithParams<void, SignInByEmailParams> {
  const SignInByEmail(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture call(SignInByEmailParams params) async =>
      _repository.signInByEmail(
        email: params.email,
        password: params.password,
      );
}

class SignInByEmailParams extends Equatable {
  final String email;
  final String password;

  const SignInByEmailParams({
    required this.email,
    required this.password,
  });

  const SignInByEmailParams.empty()
      : this(email: "test@test.ru", password: "123456");

  @override
  List<Object?> get props => [email, password];
}
