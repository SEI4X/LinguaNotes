import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lingua_notes/src/authentication/domain/entities/user.dart';
import 'package:lingua_notes/src/authentication/domain/usecases/logout.dart';
import 'package:lingua_notes/src/authentication/domain/usecases/sign_in_by_email.dart';
import 'package:lingua_notes/src/authentication/domain/usecases/sign_up_by_email.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required SignInByEmail signInByEmail,
    required SignUpByEmail signUpByEmail,
    required Logout logout,
  })  : _logout = logout,
        _signInByEmail = signInByEmail,
        _signUpByEmail = signUpByEmail,
        super(const AuthenticationState.unauthenticated()) {
    on<SignInByEmailEvent>(_signInByEmailHandler);
    on<SignUpByEmailEvent>(_signUpByEmailHandler);
    on<SignOutEvent>(_logoutHandler);
  }

  final SignInByEmail _signInByEmail;
  final Logout _logout;
  final SignUpByEmail _signUpByEmail;

  Future<void> _signUpByEmailHandler(
    SignUpByEmailEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.authentication());
  }

  Future<void> _signInByEmailHandler(
    SignInByEmailEvent event,
    Emitter<AuthenticationState> emit,
  ) async {}

  Future<void> _logoutHandler(
    SignOutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {}
}
