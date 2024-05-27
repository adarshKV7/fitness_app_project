// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, sized_box_for_whitespace

import 'package:fitness_app_project/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseController = context.read<FirebaseController>();
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome Back,",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: ColorConstants.gray,
                      ),
                    ),
                    Icon(Icons.notifications_active_outlined,
                        color: ColorConstants.gray)
                  ],
                ),
                FutureBuilder<Map<String, dynamic>?>(
                  future: firebaseController.fetchUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final userData = snapshot.data;
                      if (userData != null &&
                          userData.containsKey('firstName')) {
                        final firstName = userData['firstName'];
                        return Text(
                          " $firstName!",
                          style: GoogleFonts.roboto(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        return Text(
                          "Welcome!",
                          style: GoogleFonts.roboto(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 30),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstants.pink,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BMI (Body Mass Index)",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        FutureBuilder<Map<String, dynamic>?>(
                          future: firebaseController.fetchUserData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error');
                            } else {
                              final userData = snapshot.data;
                              if (userData != null &&
                                  userData.containsKey('weight') &&
                                  userData.containsKey('height')) {
                                final weight = userData['weight'] as double;
                                final heightCm = userData['height'] as double;
                                final heightM = heightCm /
                                    100; // Convert height from cm to meters
                                final bmi = weight / (heightM * heightM);
                                final bmiColor = getBMIColor(bmi);
                                final bmiTextAndColor = getBMITextAndColor(bmi);
                                return Column(
                                  children: [
                                    Text(
                                      bmiTextAndColor['text'],
                                      style: TextStyle(
                                        color: bmiTextAndColor['color'],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: bmiColor,
                                      child: Text(
                                        bmi.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey,
                                  child: Text(
                                    "N/A",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Activity Status",
                  style: GoogleFonts.roboto(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.pink),
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Heart Rate",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "78 BPM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 117, 13, 227),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          ImageConsatants.redHeart,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Walking Progress",
                  style: GoogleFonts.roboto(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                FutureBuilder<int>(
                  future: firebaseController.fetchStepCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final stepCount = snapshot.data ?? 0;
                      final goal = 1000; // Example goal
                      final progress = (stepCount / goal).clamp(0.0, 1.0);

                      return Center(
                        child: CircularPercentIndicator(
                          radius: 100.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: progress,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$stepCount",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                              Text(
                                "/ $goal steps",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: ColorConstants.red,
                          backgroundColor: ColorConstants.blue,
                          footer: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Keep it up!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Map<String, dynamic> getBMITextAndColor(double bmi) {
    if (bmi < 18.5) {
      return {'text': 'You have an underweight', 'color': Colors.blue};
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return {'text': 'You have a normal weight', 'color': Colors.green};
    } else {
      return {'text': 'You have an overweight', 'color': Colors.red};
    }
  }
}
