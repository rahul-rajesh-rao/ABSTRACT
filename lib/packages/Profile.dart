import 'package:abstract_mp/packages/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: -900, end: 40), weight: 80),
      TweenSequenceItem(tween: Tween<double>(begin: 40, end: 0), weight: 20),
    ]).animate(_controller);
    animation.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? username = FirebaseAuth.instance.currentUser!.displayName;
    final String? pfploc = FirebaseAuth.instance.currentUser!.photoURL;
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, animation.value),
                  child: Container(
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
                              " PROFILE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/$pfploc',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              backgroundColor: Colors.white,
                              radius: 95,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            username!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 80,
                ),
                MaterialButton(
                  height: 58,
                  minWidth: 350,
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
                    SchedulerBinding.instance!.addPostFrameCallback((_) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
