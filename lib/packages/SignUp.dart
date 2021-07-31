import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'NavScreen.dart';
import 'package:flutter/scheduler.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController repasswordController = new TextEditingController();

  String email = "";
  String password = "";
  String rePassword = "";
  String username = "";

  uploadData() async {
    int pfpNo = Random.secure().nextInt(6);
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
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
    } else if (password.isEmpty) {
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
    } else if (password != rePassword) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("password doesn't match"),
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
      print("password doesn't match");
    } else {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = FirebaseAuth.instance.currentUser;
        await user!.updateDisplayName(username);
        await user.updatePhotoURL("pfp$pfpNo.jpg");
        await user.reload();
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "username": username,
          "uid": user.uid,
          "email": email,
          "password": password
        });
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NavScreen()));
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text('The password provided is too weak.'),
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
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text('The account already exists for that email.'),
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
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      print("auth done");
    }
  }

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
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Image.asset(
                        'assets/Abstract_logo.png',
                        scale: 3.0,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      new TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        validator: (val) {
                          return val!.isEmpty ? "Enter the Username" : null;
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
                          hintText: "Username",
                          fillColor: Color(0xF5F1F1).withOpacity(0.4),
                        ),
                        onChanged: (val) {
                          username = val;
                        },
                      ),
                      SizedBox(
                        height: 7,
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
                          fontWeight: FontWeight.w600,
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
                        height: 7,
                      ),
                      new TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
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
                          hintText: "Enter Password again",
                          fillColor: Color(0xF5F1F1).withOpacity(0.4),
                        ),
                        obscureText: true,
                        controller: repasswordController,
                        onChanged: (val) {
                          rePassword = val;
                        },
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      //SizedBox(height: 90),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Sign In",
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
                          uploadData();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  )),
            )));
  }
}
