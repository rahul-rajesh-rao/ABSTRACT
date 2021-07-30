import 'package:abstract_mp/packages/SignIn.dart';
import 'package:abstract_mp/packages/play.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: HexColor("#012A4A"),
        // ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            // margin: EdgeInsets.symmetric(
            //   horizontal: 25.0,
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue,
                            Colors.cyan,
                            Colors.white,
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(45.0),
                          bottomLeft: Radius.circular(45.0)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 55, 0, 65),
                          child: Text(
                            "PROFILE ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 95,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Username ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 80,
                ),
                MaterialButton(
                  height: 58,
                  minWidth: 370,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
