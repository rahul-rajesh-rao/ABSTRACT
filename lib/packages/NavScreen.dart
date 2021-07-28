import 'package:abstract_mp/packages/Create.dart';
import 'package:abstract_mp/packages/Home.dart';
import 'package:abstract_mp/packages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  late final screen = [Home(), Create(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        index: _selectedIndex,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add_box, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screen[_selectedIndex],
    );
  }
}
