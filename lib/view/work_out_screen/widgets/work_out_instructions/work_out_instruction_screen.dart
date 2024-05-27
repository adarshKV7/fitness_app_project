// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/model/excersice_model.dart';
import 'package:fitness_app_project/view/work_out_screen/widgets/work_out_instructions/countdown_screen.dart';

import 'package:flutter/material.dart';

class WorkOutInstructionScreen extends StatelessWidget {
  const WorkOutInstructionScreen({
    super.key,
    this.exerciseModel,
  });
  final ExerciseModel? exerciseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountDownScreen(
                  image: exerciseModel?.image.toString(),
                  title: exerciseModel?.name.toString(),
                ),
              ));
        },
        backgroundColor: ColorConstants.pink,
        child: Icon(
          Icons.timer_sharp,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorConstants.white,
        centerTitle: true,
        elevation: 0,
        title: Text("Instructions",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConstants.black)),
        iconTheme: IconThemeData(color: ColorConstants.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(exerciseModel!.name.toString(),
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.red)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    exerciseModel!.image.toString(),
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Instructions",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.black)),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  exerciseModel!.instructions.toString(),
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
