import 'package:abstract_mp/packages/NavScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Celebration extends StatefulWidget {
  final int score;
  Celebration(this.score);
  @override
  _CelebrationState createState() => _CelebrationState();
}

class _CelebrationState extends State<Celebration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _animation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.00, end: 30.00), weight: 50.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30.00, end: 0.00), weight: 50.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.00, end: -30.00), weight: 50.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: -30.00, end: 0.00), weight: 50.0),
    ]).animate(_controller);
    _animation.addListener(() {
      setState(() {});
    });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int score = widget.score;
    final String? pfp = FirebaseAuth.instance.currentUser!.photoURL;
    return Scaffold(
      backgroundColor: HexColor("#012A4A"),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/CelebrateBackDrop.png',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Text(
                            "Quiz Completed!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "You got $score points.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavScreen()));
                        },
                        height: 58,
                        minWidth: 170,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30)),
                        child: Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedBuilder(
              animation: _controller.view,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/$pfp',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
