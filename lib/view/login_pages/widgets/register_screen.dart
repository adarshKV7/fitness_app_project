// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:fitness_app_project/controller/home_screen_controller.dart';
import 'package:fitness_app_project/controller/registration_screen_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/view/login_pages/login_screen.dart';
import 'package:fitness_app_project/view/personal_details_screen/personal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final controllerobj = context.watch<HomeScreenController>();
    final providerobj = context.watch<RegistraionScreeenController>();
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
                  "Create an Account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controllerobj.firstNameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_4_outlined),
                        hintText: "First Name",
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
                    controller: controllerobj.lastNameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined),
                        hintText: "Last Name",
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
                providerobj.isLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          if (controllerobj.emailController.text.isNotEmpty &&
                              controllerobj
                                  .passwordController.text.isNotEmpty) {
                            context
                                .read<RegistraionScreeenController>()
                                .register(
                                    context: context,
                                    email: controllerobj.emailController.text,
                                    password:
                                        controllerobj.passwordController.text)
                                .then((value) {
                              if (value == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text("Registration Sucess")));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PersonalDetailsScreen(),
                                    ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text("Registraion failed")));
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: ColorConstants.red,
                                content:
                                    Text("Enter a valid email and password")));
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
                                "Register",
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
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text("SignIn"))
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
