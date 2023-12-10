import 'package:lingua_notes/utils/typedef.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<void> signInByEmail({
    required String email,
    required String password,
  });
  ResultFuture<void> signUpByEmail();
  ResultVoid restorePasswordByEmail();
  ResultVoid logout();
}
