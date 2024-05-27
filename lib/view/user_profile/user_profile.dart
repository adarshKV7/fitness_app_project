// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/controller/firebase_controller.dart';
import 'package:fitness_app_project/controller/theme_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/view/login_pages/login_screen.dart';
import 'package:fitness_app_project/view/personal_details_screen/widgets/show_details_screen.dart';
import 'package:fitness_app_project/view/photo_screen/photo_screen.dart';
import 'package:fitness_app_project/view/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final firebaseController = context.read<FirebaseController>();
    final themeProvider = Provider.of<ThemeController>(context);

    Future<void> pickProfilePhoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        await firebaseController.uploadProfilePhoto(file);
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ColorConstants.gray.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20)),
                height: 80,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: pickProfilePhoto,
                      child: FutureBuilder<Map<String, dynamic>?>(
                        future: firebaseController.fetchUserData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[200],
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[200],
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
                                radius: 25,
                              );
                            } else {
                              return CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey[200],
                                child: Icon(Icons.person),
                              );
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<Map<String, dynamic>?>(
                          future: firebaseController.fetchUserData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text("");
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final userData = snapshot.data;
                              if (userData != null &&
                                  userData.containsKey('firstName')) {
                                final firstName = userData['firstName'];
                                return Text(
                                  " $firstName",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  ),
                                );
                              } else {
                                return Text(
                                  "Welcome",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        FutureBuilder<Map<String, dynamic>?>(
                            future: firebaseController.fetchUserData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text("Error:${snapshot.error}");
                              } else {
                                final userData = snapshot.data;
                                if (userData != null &&
                                    userData.containsKey("email")) {
                                  final emailaddress = userData["email"];
                                  return Text("$emailaddress");
                                } else {
                                  return Text("");
                                }
                              }
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowDetailsScreen(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ColorConstants.gray.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        FluentIcons.heart_circle_hint_16_regular,
                        color: ColorConstants.red,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Health Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoScreen(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ColorConstants.gray.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        FluentIcons.camera_arrow_up_20_regular,
                        color: ColorConstants.blue,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Photos",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPolicyScreen(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ColorConstants.gray.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.privacy_tip_outlined,
                        color: ColorConstants.blue,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Privacy and Policy",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ColorConstants.gray.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  height: 70,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.brightness_6,
                      color: ColorConstants.blue,
                      size: 30,
                    ),
                    title: Text(
                      'Dark Mode',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ColorConstants.gray.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.logout_sharp,
                        color: ColorConstants.blue,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
