// ignore_for_file: file_names

import 'package:fitness_app_project/core/constatns/image_constants.dart';
import 'package:fitness_app_project/model/excersice_model.dart';
import 'package:flutter/material.dart';

class ExcersiceScreenController with ChangeNotifier {
  List<ExerciseModel> excersiceModelList = [];
  Map<String, List<Map<String, String>>> excersiceMap = {
    "exercises": [
      {
        "name": "Push-up",
        "instructions":
            "1. Start in a plank position with your hands placed shoulder-width apart and your body forming a straight line from head to heels.\n2. Lower your body until your chest nearly touches the floor, keeping your elbows close to your sides.\n3. Push through your palms to straighten your arms, returning to the starting position.",
        "image": ImageConsatants.pushUp
      },
      {
        "name": "Squats",
        "instructions":
            "1. Stand with your feet shoulder-width apart, toes slightly turned out, and arms at your sides.\n2. Lower your body by bending your knees and pushing your hips back as if sitting into a chair, keeping your chest upright and your knees behind your toes.\n3. Push through your heels to return to the starting position, squeezing your glutes at the top.",
        "image": ImageConsatants.squats
      },
      {
        "name": "Plank",
        "instructions":
            "1. Begin in a push-up position with your hands directly beneath your shoulders and your body forming a straight line from head to heels.\n2. Engage your core muscles and hold this position, keeping your back flat and avoiding sagging or arching.",
        "image": ImageConsatants.plank
      },
      {
        "name": "Lunges",
        "instructions":
            "1. Stand tall with your feet hip-width apart and hands on your hips.\n2. Take a big step forward with your right leg, lowering your body until both knees are bent at a 90-degree angle.\n3. Push off your right foot to return to the starting position, then repeat on the other side.",
        "image": ImageConsatants.lunges
      },
      {
        "name": "Burpees",
        "instructions":
            "1. Start in a standing position.\n2. Drop into a squat position with your hands on the ground.\n3. Kick your feet back, while keeping your arms extended, to get into a push-up position.\n4. Perform a push-up.\n5. Quickly return your feet to the squat position.\n6. Jump up from the squat position, reaching your arms overhead.",
        "image": ImageConsatants.burpees
      },
      {
        "name": "Mountain Climbers",
        "instructions":
            "1. Start in a plank position with your hands directly under your shoulders.\n2. Bring your right knee towards your chest, then quickly switch legs, bringing the left knee towards your chest.\n3. Continue alternating legs as if you're running in place, keeping your core engaged and your hips level.",
        "image": ImageConsatants.mountainClimbers
      },
      {
        "name": "Jumping Jacks",
        "instructions":
            "1. Start standing with your feet together and arms at your sides.\n2. Jump your feet out wide as you simultaneously raise your arms overhead.\n3. Quickly return to the starting position by jumping your feet back together and lowering your arms.",
        "image": ImageConsatants.jumpingJacks
      },
      {
        "name": "Bicycle Crunches",
        "instructions":
            "1. Lie flat on your back with your hands behind your head and legs raised, knees bent at a 90-degree angle.\n2. Bring your right elbow towards your left knee while simultaneously straightening your right leg.\n3. Switch sides, bringing your left elbow towards your right knee while straightening your left leg.\n4. Continue alternating sides in a pedaling motion.",
        "image": ImageConsatants.bicycleCrunches
      },
      {
        "name": "Russian Twists",
        "instructions":
            "1. Sit on the floor with your knees bent and feet flat, leaning back slightly to engage your core.\n2. Hold your hands together in front of you or hold a weight.\n3. Twist your torso to the right, bringing your hands or weight towards the floor beside your hip.\n4. Return to the center and then twist to the left, repeating the motion.",
        "image": ImageConsatants.russianTwists
      },
      {
        "name": "Jump Squats",
        "instructions":
            "1. Start in a squat position with your feet shoulder-width apart.\n2. Lower your body into a squat.\n3. Explosively jump as high as you can, swinging your arms overhead.\n4. Land softly back into the squat position and immediately repeat.",
        "image": ImageConsatants.jumpSquats
      },
      {
        "name": "High Knees",
        "instructions":
            "1. Stand in place with your feet hip-width apart.\n2. Quickly drive your knees up towards your chest, alternating legs as if you're running in place.\n3. Pump your arms to increase intensity.",
        "image": ImageConsatants.highKnees
      },
      {
        "name": "Plank Jacks",
        "instructions":
            "1. Begin in a plank position with your hands directly under your shoulders.\n2. Jump your feet out wide and then back together, similar to the motion of a jumping jack.\n3. Keep your core engaged and your hips stable throughout the movement.",
        "image": ImageConsatants.plankJacks
      },
      {
        "name": "Wall Sit",
        "instructions":
            "1. Stand with your back against a wall and feet shoulder-width apart.\n2. Slide your back down the wall until your thighs are parallel to the ground and your knees are bent at a 90-degree angle.\n3. Hold this position, keeping your back flat against the wall and your core engaged.",
        "image": ImageConsatants.wallSit
      },
      {
        "name": "Tricep Dips",
        "instructions":
            "1. Sit on the edge of a sturdy chair or bench with your hands gripping the edge, fingers facing forward.\n2. Walk your feet out in front of you and lower your body off the edge of the chair, keeping your elbows pointed back.\n3. Bend your elbows to lower your body towards the ground, then straighten your arms to return to the starting position.",
        "image": ImageConsatants.tricepDips
      },
      {
        "name": "Side Plank",
        "instructions":
            "1. Start in a plank position with your hands directly beneath your shoulders.\n2. Shift your weight onto your right hand and rotate your body to the left, stacking your left foot on top of your right.\n3. Extend your left arm towards the ceiling, creating a straight line from your head to your heels.\n4. Hold this position, keeping your core engaged and your hips lifted.",
        "image": ImageConsatants.sidePlank
      },
      {
        "name": "Superman",
        "instructions":
            "1. Lie face down on the ground with your arms extended overhead and legs straight.\n2. Simultaneously lift your arms, chest, and legs off the ground as high as you can, keeping your gaze down to protect your neck.\n3. Hold this position briefly, then lower back down with control.",
        "image": ImageConsatants.superman
      },
      {
        "name": "Bridge",
        "instructions":
            "1. Lie on your back with your knees bent and feet flat on the ground, hip-width apart.\n2. Press through your heels to lift your hips towards the ceiling, engaging your glutes and core.\n3. Hold at the top for a moment, then lower back down with control.",
        "image": ImageConsatants.bridge
      },
      {
        "name": "Calf Raises",
        "instructions":
            "1. Stand with your feet hip-width apart, arms at your sides or holding onto a stable surface for balance.\n2. Rise up onto the balls of your feet, lifting your heels as high as possible.\n3. Lower your heels back down to the ground, then repeat.",
        "image": ImageConsatants.calfRaises
      }
    ]
  };

  convertToModel() {
    excersiceModelList =
        ExercisesResModel.fromJson(excersiceMap).exercises ?? [];
  }
}
