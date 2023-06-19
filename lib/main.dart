import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_auth_app/auth/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Social Auth App',
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
            return Scaffold(
              body: Center(
                child: Text("Error Initializing Firebase"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SignInScreen();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
