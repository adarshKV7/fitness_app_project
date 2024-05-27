// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:fitness_app_project/controller/firebase_controller.dart';
import 'package:fitness_app_project/controller/home_screen_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:fitness_app_project/view/first_screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  String gender = 'Male';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final controllerObj = context.read<HomeScreenController>();
    final detailsObj = context.read<FirebaseController>();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          controllerObj.dobController.text =
              DateFormat('dd-MM-yyyy').format(picked);
        });
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConsatants.sittingWithDumbel),
                  ),
                ),
                height: 300,
              ),
              SizedBox(height: 10),
              Text(
                "Let's Complete your profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "It will help us to know more about you",
                style: TextStyle(),
              ),
              SizedBox(height: 10),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: DropdownButtonFormField<String>(
                        value: gender,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          isDense: true,
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          labelText: 'Gender',
                          prefixIcon: Icon(Icons.person_add_alt),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            gender = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: controllerObj.dobController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month_outlined),
                          hintText: "Date of Birth",
                          isDense: true,
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          selectDate(context);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your DOB';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: controllerObj.weightController,
                        decoration: InputDecoration(
                          labelText: 'Weight (kg)',
                          prefixIcon: Icon(Icons.monitor_weight_outlined),
                          hintText: "Your Weight",
                          isDense: true,
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your weight';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: controllerObj.heightController,
                        decoration: InputDecoration(
                          labelText: 'Height (m)',
                          prefixIcon: Icon(Icons.height_outlined),
                          hintText: "Your Height",
                          isDense: true,
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your height';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          detailsObj.addData(
                            firstName: controllerObj.firstNameController.text,
                            lastName: controllerObj.lastNameController.text,
                            gender: gender,
                            dob: controllerObj.dobController.text,
                            weight: double.parse(
                                controllerObj.weightController.text),
                            height: double.parse(
                                controllerObj.heightController.text),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Next",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
