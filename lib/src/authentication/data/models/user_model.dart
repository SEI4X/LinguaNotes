import 'dart:convert';

import 'package:lingua_notes/src/authentication/domain/entities/user.dart';
import 'package:lingua_notes/utils/typedef.dart';

class UserModel extends LNUser {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.avatar,
    required super.learnPoints,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          email: map['email'] as String,
          name: map['name'] as String,
          avatar: map['avatar'] as String,
          learnPoints: map['learnPoints'] as int,
        );

  DataMap toMap() => {
        'id': id,
        'email': email,
        'name': name,
        'avatar': avatar,
        'learnPoints': learnPoints,
      };

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    int? learnPoints,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      learnPoints: learnPoints ?? this.learnPoints,
    );
  }

  const UserModel.empty()
      : this(
          id: '1',
          email: 'test@test.ru',
          name: 'Alex',
          avatar: 'testurl.com',
          learnPoints: 25,
        );
}
