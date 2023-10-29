import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lingua_notes/src/authentication/data/models/user_model.dart';
import 'package:lingua_notes/src/authentication/domain/entities/user.dart';
import 'package:lingua_notes/utils/typedef.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();

  test('should be a subclass of [User] entity', () {
    // Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('UserModel with the right data', () {
      // Act
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('UserModel with the right data', () {
      // Act
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('UserModel with the right data', () {
      // Act
      final result = tModel.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('UserModel with the right data', () {
      // Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "email": "test@test.ru",
        "name": "Alex",
        "avatar": "testurl.com",
        "learnPoints": 25
      });
      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('UserModel with the right data', () {
      // Act
      final result = tModel.copyWith(name: 'Paul');
      expect(result.name, equals('Paul'));
    });
  });
}
