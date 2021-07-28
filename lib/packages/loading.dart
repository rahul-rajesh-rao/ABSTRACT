import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
                    child: Container(
                      child:
                          Center(child: SvgPicture.asset('assets/loading.svg')),
                    ),
                  ),
                  LinearProgressIndicator(
                    color: Colors.white,
                    minHeight: 5,
                    backgroundColor: Colors.grey[400],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Please wait while we load your data!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
