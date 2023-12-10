import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:lingua_notes/src/authentication/presentation/views/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const LinguaNotes());
}

class LinguaNotes extends StatelessWidget {
  const LinguaNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AppLoginStatus.unauthenticated) {
          return const Scaffold(
            body: Center(
              child: Text("LOGGED IN"),
            ),
          );
        } else {
          return const RegisterPageView();
        }
      },
    ));
  }
}
