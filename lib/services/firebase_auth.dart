import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

//test
import 'package:virus_gps_system/pages/login.dart';
import 'package:virus_gps_system/pages/google_signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuthApp());
}

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Firebase  App',
        theme: ThemeData.dark(),
        home: Scaffold(
          body: AuthTypeSelector(),
        ));
  }
}

/// Provides a UI to select a authentication type page
class AuthTypeSelector extends StatelessWidget {
  // Navigates to a new page
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Example App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: 'Registration',
              onPressed: () => _pushPage(context, HomeWidget()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.verified_user,
              backgroundColor: Colors.orange,
              text: 'Sign In',
              onPressed: () => _pushPage(context, GoogleSignSystem()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
