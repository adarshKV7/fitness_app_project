// ignore_for_file: prefer_const_constructors, unused_local_variable, curly_braces_in_flow_control_structures

import 'package:fitness_app_project/controller/firebase_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/view/home_screen/home_screen.dart';
import 'package:fitness_app_project/view/photo_screen/photo_screen.dart';
import 'package:fitness_app_project/view/bmi_calculator_screen/bmi_calculator_screen.dart';
import 'package:fitness_app_project/view/user_profile/user_profile.dart';
import 'package:fitness_app_project/view/work_out_screen/work_out.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<Widget> screenList = [
    HomeScreen(),
    WorkOutScreen(),
    BmiCalculatorScreen(),
    PhotoScreen(),
    UserProfile(),
  ];
  int indexValue = 0;
  @override
  Widget build(BuildContext context) {
    final firebaseController = context.read<FirebaseController>();
    return Scaffold(
      body: screenList[indexValue],
      bottomNavigationBar: SizedBox(
        child: SingleChildScrollView(
          child: BottomNavigationBar(
            onTap: (value) {
              if (value != 2) {
                indexValue = value;
                setState(() {});
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiCalculatorScreen(),
                    ));
              }
            },
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 10),
            selectedItemColor: ColorConstants.pink,
            currentIndex: indexValue,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(
                    FluentIcons.home_12_regular,
                    size: 25,
                  ),
                  label: "Home"),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sports_gymnastics_sharp,
                    size: 25,
                  ),
                  label: "WorkOut"),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: ColorConstants.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      color: ColorConstants.white,
                      FluentIcons.calculator_16_filled,
                      size: 25,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                icon: Icon(
                  FluentIcons.camera_16_regular,
                  size: 28,
                ),
                label: "Camera",
              ),
              BottomNavigationBarItem(
                  icon: FutureBuilder<Map<String, dynamic>?>(
                    future: firebaseController.fetchUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.grey[200],
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 13,
                          child: Icon(Icons.error),
                        );
                      } else {
                        final userData = snapshot.data;
                        if (userData != null &&
                            userData.containsKey('profilePhoto') &&
                            userData['profilePhoto'].isNotEmpty) {
                          final profilePhoto = userData['profilePhoto'];
                          return CircleAvatar(
                            backgroundImage: NetworkImage(profilePhoto),
                            radius: 13,
                          );
                        } else {
                          return CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.person),
                          );
                        }
                      }
                    },
                  ),
                  label: "You"),
            ],
          ),
        ),
      ),
    );
  }
}
