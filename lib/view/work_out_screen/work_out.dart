// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_app_project/controller/excersics%20_screen_controller.dart';
import 'package:fitness_app_project/view/work_out_screen/widgets/work_out_instructions/work_out_instruction_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({super.key});

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  @override
  void initState() {
    context.read<ExcersiceScreenController>().convertToModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final excerisceProvider = context.watch<ExcersiceScreenController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Workout Routines'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: excerisceProvider.excersiceModelList.length,
          itemBuilder: (context, index) {
            final exercise = excerisceProvider.excersiceModelList[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkOutInstructionScreen(
                            exerciseModel: exercise,
                          ),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/exercise_${index % 5}.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      ),
                    ),
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              exercise.name.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
