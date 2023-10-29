import 'package:lingua_notes/core/usecase/usecase.dart';
import 'package:lingua_notes/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:lingua_notes/utils/typedef.dart';

class Logout extends UsecaseWithoutParams {
  const Logout(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call() async => _repository.logout();
}
