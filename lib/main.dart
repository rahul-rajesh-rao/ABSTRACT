import 'dart:html';

import 'package:abstract_mp/packages/NavScreen.dart';
import 'package:abstract_mp/packages/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
        theme: ThemeData(
          fontFamily: "Montserrat",
        ),
        home: AuthWrapper());
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print("works");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavScreen()));
      }
    });
    return SignIn();
  }
}
// TODO 
// SET CONDITION FOR THE TIMER,CHECK STATE AND DISPOSE ISSUE
// ANIMATION SHOULD RESTART ON PRESS 
// SVG WORK 
// PAGE REROUTING ,DUPLICATE CELEBRATION PAGE
// PROFILE DETAILS