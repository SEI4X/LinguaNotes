import 'package:lingua_notes/src/authentication/domain/entities/user.dart';
import 'package:lingua_notes/utils/typedef.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  ResultFuture<User> getUserData({
    required String id,
  });

  // TODO: - complete other cases
  // ResultFuture<User> signUpByEmail();
  // ResultVoid restorePasswordByEmail();
  // ResultVoid logout();
}
