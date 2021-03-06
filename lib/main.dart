import 'package:flutter/material.dart';
import 'package:virus_gps_system/pages/gps_tracker.dart';
import 'pages/private_data.dart';
import 'pages/s_signin.dart';
import 'pages/qr_generator_page.dart';
import 'pages/qr_scaner_page.dart';
import 'pages/google_signin.dart';
import 'pages/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corona keeper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Google signin'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWidget()),
                );
              },
            ),
            RaisedButton(
              child: Text('People'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonSignIn()),
                );
              },
            ),
            RaisedButton(
              child: Text('Store'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoreSignIn()),
                );
              },
            ),
            RaisedButton(
              child: Text('GPS'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GpsTracker()),
                );
              },
            ),
            RaisedButton(
              child: Text('QR make'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneratePage()),
                );
              },
            ),
            RaisedButton(
              child: Text('QR recog'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScanPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
