part of 'authentication_bloc.dart';

enum AppLoginStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AppLoginStatus status;
  final LNUser user;

  const AuthenticationState._(
      {required this.status, this.user = const LNUser.empty()});

  const AuthenticationState.authentication()
      : this._(status: AppLoginStatus.authenticated);

  const AuthenticationState.authenticated(LNUser user)
      : this._(status: AppLoginStatus.authenticated, user: user);

  const AuthenticationState.unauthentication()
      : this._(status: AppLoginStatus.authenticated);

  const AuthenticationState.unauthenticated()
      : this._(status: AppLoginStatus.unauthenticated);

  const AuthenticationState.unknown() : this._(status: AppLoginStatus.unknown);

  @override
  List<Object> get props => [status, user];
}
