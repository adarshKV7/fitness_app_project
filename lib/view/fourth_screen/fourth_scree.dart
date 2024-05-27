// ignore_for_file: prefer_const_constructors

import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:fitness_app_project/view/fifth_screen/fifth_screen.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FifthScreen(),
              ));
        },
        child: Icon(Icons.arrow_forward_outlined),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConsatants.eatWell))),
            height: 350,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Eat Well!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Let's start a healthy lifedtyle with us, we can determine your diet every day,helathy eating is fun.",
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
