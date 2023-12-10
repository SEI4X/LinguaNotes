import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingua_notes/core/errors/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lingua_notes/src/authentication/data/models/user_model.dart';
import 'package:lingua_notes/utils/global_constants.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> signInByEmail({
    required String email,
    required String password,
  });

  Stream<User?> getUser();
  Future<void> logout();

  Future<UserModel> signUpByEmail({
    required UserModel userModel,
    required String password,
  });

  Future<void> setUserDataToFB({required UserModel userModel});
}

class AuthRemoteDataSrcImpl extends AuthenticationRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final userCollection =
      FirebaseFirestore.instance.collection(GlobalConstants.usersCollection);

  @override
  Stream<User?> getUser() {
    return _auth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signInByEmail(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 400);
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpByEmail(
      {required UserModel userModel, required String password}) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );

      userModel = userModel.copyWith(id: user.user!.uid);
      return userModel;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 400);
    }
  }

  @override
  Future<void> setUserDataToFB({required UserModel userModel}) async {
    try {
      await userCollection.doc(userModel.id).set(userModel.toMap());
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 400);
    }
  }
}
