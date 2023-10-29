import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lingua_notes/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteDataSource = AuthRemoteDataSrcImpl();

  final result = await remoteDataSource.signInByEmail(
      email: 'test@linguanotes.com', password: '123456');

  runApp(const LinguaNotes());
}

class LinguaNotes extends StatelessWidget {
  const LinguaNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
