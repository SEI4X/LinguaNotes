import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lingua_notes/src/authentication/domain/entities/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.unauthenticated()) {
    on<SignInByEmailEvent>();
  }
}
