// ignore_for_file: prefer_const_constructors

import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:fitness_app_project/view/fourth_screen/fourth_scree.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FourthScreen(),
              ));
        },
        child: Icon(Icons.arrow_forward_outlined),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConsatants.runningMan))),
            height: 350,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Get Burn!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Let's keep burning, to achiev your goals, it hurts only tempararily,if you give up now you will be in pain forever",
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
