// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import

import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:fitness_app_project/view/personal_details_screen/widgets/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "What is Your goal?",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "It will help us to choose a best program for you!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            color: ColorConstants.blue,
                            borderRadius: BorderRadius.circular(20)),
                        height: 500,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                  image: AssetImage(ImageConsatants.dombel)),
                            ),
                            Text(
                              "Improve Shape",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.white,
                                  letterSpacing: 2),
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              thickness: 3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "I have a Low Amount of body fat and need/want to build more muscle",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstants.white,
                                    letterSpacing: 1),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            color: ColorConstants.blue,
                            borderRadius: BorderRadius.circular(20)),
                        height: 500,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                  image: AssetImage(ImageConsatants.jumping)),
                            ),
                            Text(
                              "Lean & Tone",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.white,
                                  letterSpacing: 2),
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              thickness: 3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "I'm skinny fat',look thin but have no shape.I want to add learn muscle in the right way",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstants.white,
                                    letterSpacing: 1),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            color: ColorConstants.blue,
                            borderRadius: BorderRadius.circular(20)),
                        height: 500,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Image(image: AssetImage(ImageConsatants.run)),
                            ),
                            Text(
                              "Loss a Fat",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.white,
                                  letterSpacing: 2),
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              thickness: 3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "I have over 20 lbs to lose.I want to drop all this fat and gain muscle mass",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstants.white,
                                    letterSpacing: 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IntroScreen(),
                      ));
                },
                child: Container(
                    height: 60,
                    width: 280,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
