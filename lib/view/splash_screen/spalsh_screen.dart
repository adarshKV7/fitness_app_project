// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:fitness_app_project/core/constatns/color_constants.dart';

import 'package:fitness_app_project/view/login_pages/login_screen.dart';
import 'package:fitness_app_project/view/personal_details_screen/widgets/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.isAlreadyLogged = false});
  final bool isAlreadyLogged;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (widget.isAlreadyLogged) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IntroScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.liteWhite,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Be Fit",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Sedgwick',
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.red),
            ),
            Text(
              "Everybody Can Train",
              style: TextStyle(fontFamily: "Sevillana", fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
