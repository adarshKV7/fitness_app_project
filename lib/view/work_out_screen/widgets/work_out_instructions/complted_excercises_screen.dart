// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_app_project/controller/time_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';

class CompletedExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final completedExercises =
        context.watch<TimerController>().completedExercises;

    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Exercises'),
        backgroundColor: ColorConstants.blue,
      ),
      body: ListView.builder(
        itemCount: completedExercises.length,
        itemBuilder: (context, index) {
          final exercise = completedExercises[index];
          final minutes = (exercise.timeTaken! ~/ 60000);
          final seconds = ((exercise.timeTaken! % 60000) ~/ 1000);
          log(exercise.name.toString());

          return ListTile(
            title: Text(exercise.name.toString()),
            subtitle: Text('${minutes}m ${seconds}s'),
          );
        },
      ),
    );
  }
}
