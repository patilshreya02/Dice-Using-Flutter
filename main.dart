import 'dart:math'; //grey color tell that u have imported lib but not yet used
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      // Create a container to apply gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent, // Make Scaffold transparent
          appBar: AppBar(
            title: const Text(
              "Dice",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.purple,
            centerTitle: true,
          ),
          body: const dice(),
        ),
      ),
    ),
  ));
}

class dice extends StatefulWidget {
  const dice({super.key});

  @override
  State<dice> createState() => _diceState();
}

class _diceState extends State<dice> {
  var leftdicenum =
      6; // this one is inserted by using $ and var name so this num will shown on dice and we put inside curly brace bcz it should change when we save or reload
  var rightdicenum = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            // here padding was there but after adding textbuttoon  padding came alsong with it so padding was applied 2 times
            child: TextButton(
              onPressed: () {
                // Add your onPressed logic here
                setState(() {
                  leftdicenum = Random().nextInt(6) +
                      1; // what if we want from 1-6 rather than 0-5 +1 bcz random
                  // number generates from 0 to 6 but dice0.png is not there and it
                  // shows empty image.if its gonna be 0 it turns into 1
                });
              },
              child: Image.asset("images/dice$leftdicenum.png"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                // Add your onPressed logic here
                setState(() {
                  rightdicenum = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset("images/dice$rightdicenum.png"),
            ),
          ),
        ],
      ),
    );
  }
}
//In Flutter, the Scaffold widget needs the body property to know what to display
// in the main area of the screen. Without it, the content simply won't show up, even though the app
// itself runs without crashing

