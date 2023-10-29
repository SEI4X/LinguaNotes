part of 'authentication_bloc.dart';

enum AppLoginStatus { authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  final AppLoginStatus status;
  final User user;

  const AuthenticationState._({required this.status, this.user = const User.empty()});

  const AuthenticationState.authenticated(User user)
      : this._(status: AppLoginStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AppLoginStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}

