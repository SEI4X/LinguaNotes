import 'package:equatable/equatable.dart';
import 'package:lingua_notes/core/usecase/usecase.dart';
import 'package:lingua_notes/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:lingua_notes/utils/typedef.dart';

class SignUpByEmail extends UsecaseWithParams<void, SignUpByEmailParams> {
  const SignUpByEmail(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture call(SignUpByEmailParams params) async =>
      _repository.signUpByEmail();
}

class SignUpByEmailParams extends Equatable {
  final String email;
  final String password;

  const SignUpByEmailParams({
    required this.email,
    required this.password,
  });

  const SignUpByEmailParams.empty()
      : this(email: "test@test.ru", password: "123456");

  @override
  List<Object?> get props => [email, password];
}
