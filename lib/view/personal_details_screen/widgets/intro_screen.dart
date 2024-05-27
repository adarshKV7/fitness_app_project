// ignore_for_file: prefer_const_constructors

import 'package:fitness_app_project/controller/firebase_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app_project/bottom_navigation_bar/bottom_navigation_bar.dart';

import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseController = context.read<FirebaseController>();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConsatants.group),
                ),
              ),
              height: 350,
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: FutureBuilder<Map<String, dynamic>?>(
              future: firebaseController.fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final userData = snapshot.data;
                  if (userData != null && userData.containsKey('firstName')) {
                    final firstName = userData['firstName'];
                    return Text(
                      "Welcome $firstName!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
                    );
                  } else {
                    return Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
                    );
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "You are all set now. Let's reach your goals together with us.",
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationBarScreen(),
                ),
              );
            },
            child: Container(
              height: 60,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Go to Home",
                  style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
