import 'package:lingua_notes/core/errors/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRemoteDataSource {
  Future<String> signInByEmail({
    required String email,
    required String password,
  });

  Future<void> logout();
}

class AuthRemoteDataSrcImpl extends AuthenticationRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> signInByEmail(
      {required String email, required String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = result.user?.uid;

      if (userId != null) {
        return userId;
      } else {
        throw const APIException(message: "Login error", statusCode: 400);
      }
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 400);
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
