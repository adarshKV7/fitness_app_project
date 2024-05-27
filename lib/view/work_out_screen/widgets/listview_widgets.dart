// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names

import 'package:fitness_app_project/controller/excersics%20_screen_controller.dart';
import 'package:fitness_app_project/controller/time_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListviewWidgets extends StatefulWidget {
  const ListviewWidgets({
    super.key,
  });

  @override
  State<ListviewWidgets> createState() => _ListviewWidgetsState();
}

class _ListviewWidgetsState extends State<ListviewWidgets> {
  @override
  Widget build(BuildContext context) {
    final excersicsobj = context.read<ExcersiceScreenController>();
    final timerController = context.watch<TimerController>();
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: timerController.completedExercises.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: Center(
                  child: Text(timerController.completedExercises[index].name
                      .toString()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ${exercise.name} - ${exercise.timeTaken}s
