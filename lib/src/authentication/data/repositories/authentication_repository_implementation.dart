import 'package:dartz/dartz.dart';
import 'package:lingua_notes/core/errors/exception.dart';
import 'package:lingua_notes/core/errors/failure.dart';
import 'package:lingua_notes/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:lingua_notes/src/authentication/domain/entities/user.dart';
import 'package:lingua_notes/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:lingua_notes/utils/typedef.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<void> signInByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.signInByEmail(
          email: email, password: password);
      return Right(result);
    } on APIException catch (exception) {
      return Left(APIFailure.fromException(exception));
    }
  }

  @override
  ResultVoid logout() async {
    try {
      await _remoteDataSource.logout();
      return const Right(null);
    } on APIException catch (exception) {
      return Left(APIFailure.fromException(exception));
    }
  }

  @override
  ResultVoid restorePasswordByEmail() {
    // TODO: implement restorePasswordByEmail
    throw UnimplementedError();
  }

  @override
  ResultFuture<LNUser> signUpByEmail() {
    // TODO: implement signUpByEmail
    throw UnimplementedError();
  }
}
