import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#012A4A"),
      appBar: AppBar(
        backgroundColor: HexColor("#012A4A"),
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
            SizedBox(height: 90),
            Row(
              children: [
                Text("Question ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
                Text("1/10 ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
                child: Text("Oil, natural gas and coal are examples of …",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 58,
              minWidth: 370,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: new BorderRadius.circular(15)),
              child: Text(
                "Option 1",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 58,
              minWidth: 370,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: new BorderRadius.circular(15)),
              child: Text(
                "Option 2",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 58,
              minWidth: 370,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: new BorderRadius.circular(15)),
              child: Text(
                "Option 3",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 60.0),
              child: MaterialButton(
                  height: 58,
                  minWidth: 250,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {}),
            ),
          ]),
        ),
      ),
    );
  }
}
