import 'package:lingua_notes/src/authentication/domain/entities/user.dart';
import 'package:lingua_notes/utils/typedef.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<String> signInByEmail({
    required String email,
    required String password,
  });
  ResultFuture<User> signUpByEmail();
  ResultVoid restorePasswordByEmail();
  ResultVoid logout();
}
