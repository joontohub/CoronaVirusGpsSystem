import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppState {
  bool loading;
  User user;
  AppState(this.loading, this.user);
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final app = AppState(false, null);
  @override
  Widget build(BuildContext context) {
    if (app.loading) return _loading();
    if (app.user == null) return _logIn();
    return _main();
  }

  Widget _loading() {
    return Scaffold(
        appBar: AppBar(title: Text('loading...')),
        body: Center(child: CircularProgressIndicator()));
  }

  Widget _logIn() {
    return Scaffold(
        appBar: AppBar(title: Text('login page')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('login'),
                onPressed: () {
                  _signIn();
                })
          ],
        )));
  }

  Widget _main() {
    return Scaffold(
        appBar: AppBar(
          title: Text('loginsss'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                _signOut();
              },
            )
          ],
        ),
        body: Center(child: Text('contents')));
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> _signIn() async {
    setState(() => app.loading = true);
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // await _auth.signInWithCredential(credential);
    // final User user = authResult.user;
    final User user = (await _auth.signInWithCredential(credential)).user;
    print(user);

    setState(() {
      app.loading = false;
      app.user = user;
    });

    return 'success';
  }

  void _signOut() async {
    await googleSignIn.signOut();
    // await _auth.signOut();
    setState(() {
      app.user = null;
    });
  }
}
