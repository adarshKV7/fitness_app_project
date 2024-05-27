// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:audioplayers/audioplayers.dart';
import 'package:fitness_app_project/bottom_navigation_bar/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_app_project/controller/time_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/model/excersice_model.dart';

class CountDownScreen extends StatefulWidget {
  const CountDownScreen({
    Key? key,
    this.title,
    this.image,
    this.exercise,
  }) : super(key: key);

  final String? title;
  final String? image;
  final ExerciseModel? exercise;

  @override
  State<CountDownScreen> createState() => _CountDownScreenState();
}

class _CountDownScreenState extends State<CountDownScreen> {
  late AudioPlayer audioPlayer;
  final TextEditingController _minutesController = TextEditingController();
  final TextEditingController _secondsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  // Method to play the beep sound
  void playBeepSound() async {
    await audioPlayer.play(AssetSource(
        "assets/images/alarm-beep-34359.mp3")); // Ensure you have the beep sound file in the assets
  }

  // Method to format the time
  String formatTime(int totalMilliseconds) {
    final minutes = (totalMilliseconds ~/ 60000);
    final seconds = ((totalMilliseconds % 60000) ~/ 1000);
    final milliseconds = (totalMilliseconds % 1000) ~/ 10;

    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final millisecondsStr = milliseconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr:$millisecondsStr';
  }

  void _setTimerDuration(BuildContext context) {
    final int minutes = int.tryParse(_minutesController.text) ?? 0;
    final int seconds = int.tryParse(_secondsController.text) ?? 0;
    final int totalMilliseconds = (minutes * 60 + seconds) * 1000;

    context.read<TimerController>().setTimerDuration(totalMilliseconds);
  }

  @override
  Widget build(BuildContext context) {
    final counterobj = context.watch<TimerController>();

    // Check if the countdown has stopped and play the beep sound
    if (counterobj.current == 0) {
      playBeepSound();
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.white,
        elevation: 0,
        title: Text(
          widget.title ?? 'Exercise',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConstants.blue,
              fontSize: 25),
        ),
        iconTheme: IconThemeData(color: ColorConstants.blue),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (widget.image != null)
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    widget.image!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              ' ${formatTime(counterobj.current)}',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.blue),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<TimerController>().startTimer();
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<TimerController>().stopTimer();
                  },
                  child: Text(
                    'Stop',
                    style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<TimerController>().pauseTimer();
                  },
                  child: Text(
                    'Pause',
                    style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<TimerController>().resumeTimer();
                  },
                  child: Text(
                    'Resume',
                    style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _minutesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Minutes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _secondsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Seconds',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _setTimerDuration(context),
              child: Text(
                'Set Timer',
                style: TextStyle(
                    color: ColorConstants.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (widget.exercise != null) {
                  widget.exercise!.timeTaken =
                      counterobj.start - counterobj.current;

                  context
                      .read<TimerController>()
                      .saveCompletedExercise(widget.exercise!);
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationBarScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorConstants.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
