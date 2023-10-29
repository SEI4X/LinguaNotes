import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lingua_notes/src/authentication/domain/entities/user.dart';
import 'package:lingua_notes/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:lingua_notes/src/authentication/domain/usecases/sign_in_by_email.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late SignInByEmail usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = SignInByEmail(repository);
  });

  const params = SignInByEmailParams.empty();
  final testUser = const User.empty().id;

  test(
    "should call the [AuthRepo.createUser] and return User",
    () async {
      // Arrange
      when(() => repository.signInByEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Right(testUser));

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, equals(Right<dynamic, String>(testUser)));
      verify(() => repository.signInByEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
