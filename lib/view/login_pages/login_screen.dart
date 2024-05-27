// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:fitness_app_project/controller/home_screen_controller.dart';
import 'package:fitness_app_project/controller/login_screen_controller.dart';

import 'package:fitness_app_project/core/constatns/color_constants.dart';

import 'package:fitness_app_project/view/login_pages/widgets/register_screen.dart';

import 'package:fitness_app_project/view/personal_details_screen/widgets/intro_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controllerobj = context.read<HomeScreenController>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Text(
                  " Hey There,",
                  style: TextStyle(fontSize: 18),
                )),
                Center(
                    child: Text(
                  "WelCome Back",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controllerobj.emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "Email",
                        isDense: true,
                        filled: true,
                        fillColor: ColorConstants.lightGrey,
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controllerobj.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Password",
                        isDense: true,
                        filled: true,
                        fillColor: ColorConstants.lightGrey,
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    if (controllerobj.emailController.text.isNotEmpty &&
                        controllerobj.passwordController.text.isNotEmpty) {
                      context
                          .read<LoginScreenController>()
                          .onLogin(
                              context: context,
                              email: controllerobj.emailController.text,
                              password: controllerobj.passwordController.text)
                          .then((value) {
                        if (value == true) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Login Success")));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IntroScreen(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Login failed")));
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: ColorConstants.red,
                          content: Text("Enter a valid email and password")));
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.white),
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Or"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));
                        },
                        child: Text("Register Now"))
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
