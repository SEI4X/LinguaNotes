import 'package:equatable/equatable.dart';
import 'package:lingua_notes/core/usecase/usecase.dart';
import 'package:lingua_notes/src/profile/domain/repositories/profile_repository.dart';
import 'package:lingua_notes/utils/typedef.dart';

class GetUserData extends UsecaseWithParams<void, GetUserDataParams> {
  const GetUserData(this._repository);

  final ProfileRepository _repository;

  @override
  ResultFuture call(GetUserDataParams params) async =>
      _repository.getUserData(id: params.id);
}

class GetUserDataParams extends Equatable {
  final String id;

  const GetUserDataParams({required this.id});
  const GetUserDataParams.empty() : this(id: "1");

  @override
  List<Object?> get props => [id];
}
