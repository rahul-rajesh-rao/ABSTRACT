import 'package:abstract_mp/packages/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String username;

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
            child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 150,
                    // ),
                    new TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter the Username" : null;
                      },
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 21,
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
                      validator: (val) {
                        return val.isEmpty ? "Enter the Email" : null;
                      },
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                        hintText: "Email",
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    new TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter the Password" : null;
                      },
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                        hintText: "Password",
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    new TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter the Password" : null;
                      },
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                        hintText: "Enter Password again",
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    SizedBox(height: 130),
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
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
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ))));
  }
}
