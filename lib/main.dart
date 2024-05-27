// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:fitness_app_project/controller/excersics%20_screen_controller.dart';
import 'package:fitness_app_project/controller/firebase_controller.dart';
import 'package:fitness_app_project/controller/home_screen_controller.dart';
import 'package:fitness_app_project/controller/login_screen_controller.dart';
import 'package:fitness_app_project/controller/registration_screen_controller.dart';
import 'package:fitness_app_project/controller/theme_controller.dart';
import 'package:fitness_app_project/controller/time_controller.dart';
import 'package:fitness_app_project/firebase_options.dart';

import 'package:fitness_app_project/view/splash_screen/spalsh_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = context.read<ThemeController>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ExcersiceScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistraionScreeenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TimerController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            theme: themeController.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SplashScreen(
                    isAlreadyLogged: true,
                  );
                } else {
                  return SplashScreen(
                    isAlreadyLogged: false,
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
