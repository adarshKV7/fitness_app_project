// To parse this JSON data, do
//
//     final exercisesResModel = exercisesResModelFromJson(jsonString);

import 'dart:convert';

ExercisesResModel exercisesResModelFromJson(String str) =>
    ExercisesResModel.fromJson(json.decode(str));

String exercisesResModelToJson(ExercisesResModel data) =>
    json.encode(data.toJson());

class ExercisesResModel {
  List<ExerciseModel>? exercises;

  ExercisesResModel({
    this.exercises,
  });

  factory ExercisesResModel.fromJson(Map<String, dynamic> json) =>
      ExercisesResModel(
        exercises: json["exercises"] == null
            ? []
            : List<ExerciseModel>.from(
                json["exercises"]!.map((x) => ExerciseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exercises": exercises == null
            ? []
            : List<dynamic>.from(exercises!.map((x) => x.toJson())),
      };
}

class ExerciseModel {
  String? name;
  String? instructions;
  String? image;
  int? timeTaken; // new property

  ExerciseModel({
    this.name,
    this.instructions,
    this.image,
    this.timeTaken,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        name: json["name"],
        instructions: json["instructions"],
        image: json["image"],
        timeTaken: json["timeTaken"], // new property
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "instructions": instructions,
        "image": image,
        "timeTaken": timeTaken, // new property
      };
}
