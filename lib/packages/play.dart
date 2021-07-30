import 'package:abstract_mp/packages/NavScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class play extends StatefulWidget {
  const play({Key? key}) : super(key: key);

  @override
  _playState createState() => _playState();
}

class _playState extends State<play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Topic",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Text("Made By",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Difficulty level:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/play.svg',
                          height: 450,
                          width: 1000,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
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
                          "Play",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
