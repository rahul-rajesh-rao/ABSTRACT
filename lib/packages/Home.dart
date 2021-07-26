import 'package:abstract_mp/packages/Difficulty.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#012A4A"),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SvgPicture.asset("assets/Abstract_logo.svg",
              height: 30.0, width: 30.0),
        ),
        backgroundColor: HexColor("#012A4A"),
        elevation: 0,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 270, 0),
              child: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 180, 0),
              child: Text(
                "Choose By Topic",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 220.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Science", "17")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Science.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Science',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Computer", "18")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Computer.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Computer',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Difficulty("Math", "19")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Math.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Math',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Sports", "21")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Sports.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Sports',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Difficulty("Music", "12")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Music.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Music',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Difficulty("Film", "11")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Movie.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Film',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Video Games", "15")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Videogames.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Video Games',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Geography", "22")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Geography.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Geography',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Vehicels", "28")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Vechicel.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Vehicels',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Gadgets", "30")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Gadget.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Gadgets',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Difficulty("Arts", "25")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Art.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Arts',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("Politics", "24")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/Politics.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'Politics',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Difficulty("History", "23")));
                    },
                    child: Container(
                      width: 160.0,
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/History.svg'),
                          SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                              child: Text(
                                'History',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: HexColor('#ffffff'),
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Made By Your Commrades!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
