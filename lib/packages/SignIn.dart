import 'package:abstract_mp/packages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'NavScreen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        appBar: AppBar(
          backgroundColor: HexColor("#012A4A"),
          elevation: 0,
        ),
        body: Form(
            key: _formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Image.asset(
                        'assets/Abstract_logo.png',
                        scale: 3.0,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      new TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        validator: (val) {
                          return val!.isEmpty ? "Enter the Email" : null;
                        },
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(15.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                          hintText: "Email",
                          fillColor: Color(0xF5F1F1).withOpacity(0.4),
                        ),
                        controller: emailController,
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      new TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        validator: (val) {
                          return val!.isEmpty ? "Enter the Password" : null;
                        },
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(15.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                          hintText: "Password",
                          fillColor: Color(0xF5F1F1).withOpacity(0.4),
                        ),
                        obscureText: true,
                        controller: passwordController,
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 205, 5),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Dont have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 2),
                      MaterialButton(
                        height: 58,
                        minWidth: 370,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30)),
                        onPressed: () async {
                          final String email = emailController.text.trim();
                          final String password =
                              passwordController.text.trim();

                          if (email.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content: Text("enter email"),
                                    actions: [
                                      TextButton(
                                        child: Text("Ok"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                            print("enter email");
                          } else {
                            if (password.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text("password is empty"),
                                      actions: [
                                        TextButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                              print("password is empty");
                            } else {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: email, password: password);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavScreen()));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                              'No user found for that email.'),
                                          actions: [
                                            TextButton(
                                              child: Text("Ok"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                              'Wrong password provided for that user.'),
                                          actions: [
                                            TextButton(
                                              child: Text("Ok"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            }
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        color: Colors.white,
                      )
                    ],
                  )),
            )));
  }
}
