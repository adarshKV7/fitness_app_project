// ignore_for_file: prefer_conditional_assignment

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/model/excersice_model.dart';

class TimerController with ChangeNotifier {
  Timer? timer;
  List<ExerciseModel> completedExercises = [];
  int start = 60 * 1000; // default initial countdown time (in milliseconds)
  int current = 60 * 1000; // to keep track of current countdown time

  void setTimerDuration(int milliseconds) {
    start = milliseconds;
    current = milliseconds;
    notifyListeners();
  }

  void startTimer() {
    stopTimer();
    current = start;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (current > 0) {
        current -= 10;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
    current = start;
    notifyListeners();
  }

  void pauseTimer() {
    timer?.cancel();
    timer = null;
    notifyListeners();
  }

  void resumeTimer() {
    if (timer == null) {
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        if (current > 0) {
          current -= 10;
          notifyListeners();
        } else {
          stopTimer();
        }
      });
    }
  }

  void saveCompletedExercise(ExerciseModel exercise) {
    completedExercises.add(exercise);
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
