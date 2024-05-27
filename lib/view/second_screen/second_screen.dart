// ignore_for_file: prefer_const_constructors

import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:fitness_app_project/view/third_screen/third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ThirdScreen(),
              ));
        },
        child: Icon(Icons.arrow_forward_outlined),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConsatants.girlPhto))),
            height: 350,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Track Your Goal !",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Dont worry if your have trouble determining your goals,We Can help you determine your goals and track your goals",
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
