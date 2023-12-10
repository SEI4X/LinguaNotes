import 'package:equatable/equatable.dart';

class LNUser extends Equatable {
  const LNUser({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.learnPoints,
  });

  const LNUser.empty()
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
