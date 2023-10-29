import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.learnPoints,
  });

  const User.empty()
      : this(
          id: "0",
          email: '',
          name: 'Anonyme',
          avatar: '',
          learnPoints: 0,
        );

  final String id;
  final String email;
  final String name;
  final String avatar;
  final int learnPoints;

  @override
  List<Object?> get props => [id];
}
