// ignore_for_file: prefer_const_constructors

import 'package:fitness_app_project/core/constatns/image_constants.dart';

import 'package:fitness_app_project/view/personal_details_screen/widgets/confirmation_screen.dart';

import 'package:flutter/material.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmationScreen(),
              ));
        },
        child: Icon(Icons.arrow_forward_outlined),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConsatants.yogaGrl))),
            height: 350,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Improve Sleep Quality!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Improve the quality of your sleep with us,good quality sleep can bring a good mood in the morning.",
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
