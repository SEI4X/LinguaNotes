part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignInByEmailEvent extends AuthenticationEvent {
  const SignInByEmailEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthenticationEvent {}

class SignUpByEmailEvent extends AuthenticationEvent {
  const SignUpByEmailEvent(
      {required this.email, required this.password, required this.name});

  final String email;
  final String password;
  final String name;

  @override
  List<Object> get props => [email, password];
}
