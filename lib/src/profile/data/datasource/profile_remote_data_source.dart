import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingua_notes/core/errors/exception.dart';
import 'package:lingua_notes/src/authentication/data/models/user_model.dart';
import 'package:lingua_notes/utils/global_constants.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getProfileData({required String id});
}

class ProfileRemoteDataSrcImpl extends ProfileRemoteDataSource {
  final CollectionReference _profileCollection =
      FirebaseFirestore.instance.collection(GlobalConstants.usersCollection);

  @override
  Future<UserModel> getProfileData({required String id}) async {
    final result = await _profileCollection.doc(id).get();
    throw APIException(message: "message", statusCode: 200);
  }
}
