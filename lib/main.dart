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
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthWrapper());
  }
}

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    });
    return Container(child: Center(child: CircularProgressIndicator()));
  }
}

// class AuthWrapper extends StatelessWidget {
//   late Future<User> userdata;
//   Future<User> checkLogin() async {
//     late User userData;
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user != null) {
//         userData = user;
//       }
//     });
//     return userData;
//   }

//   @override
//   initState() {
//     userdata = checkLogin();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     //   // if (user != null) {
//     //   //   print("works");
//     //   //
//     //   // }
//     // });
//     return /*SignIn();*/ FutureBuilder(builder: (context, snapshot) {
//       if (snapshot.data == null) {
//         return SignIn();
//       } else if (snapshot != null) {
//         return NavScreen();
//       } else if (snapshot.hasError) {
//         return Text('${snapshot.error}');
//       }
//       return Container(child: Center(child: CircularProgressIndicator()));
//     });
//   }
// }
