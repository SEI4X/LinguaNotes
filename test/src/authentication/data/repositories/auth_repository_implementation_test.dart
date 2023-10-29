import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingua_notes/core/errors/exception.dart';
import 'package:lingua_notes/core/errors/failure.dart';
import 'package:lingua_notes/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:lingua_notes/src/authentication/data/models/user_model.dart';
import 'package:lingua_notes/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repoImpl = AuthenticationRepositoryImplementation(remoteDataSource);
  });

  const tException = APIException(message: 'Test', statusCode: 500);

  group('sighInByEmail', () {
    test('sign in', () async {
      when(() => remoteDataSource.signInByEmail(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => const UserModel.empty().id);

      final result =
          await repoImpl.signInByEmail(email: 'email', password: 'password');

      expect(result, equals(Right(const UserModel.empty().id)));
      verify(() => remoteDataSource.signInByEmail(
          email: 'email', password: 'password')).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('FAILUR', () async {
      when(
        () => remoteDataSource.signInByEmail(
          email: any(named: 'email'),
          password: any(
            named: 'password',
          ),
        ),
      ).thenThrow(tException);

      final result =
          await repoImpl.signInByEmail(email: 'email', password: 'password');

      expect(
        result,
        equals(Left(APIFailure(
            message: tException.message, statusCode: tException.statusCode))),
      );

      verify(() => remoteDataSource.signInByEmail(
          email: 'email', password: 'password')).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('logout', () {
    test('logout', () async {
      when(() => remoteDataSource.logout())
          .thenAnswer((_) async => Future.value());

      final result = await repoImpl.logout();

      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.logout()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
