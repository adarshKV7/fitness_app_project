// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pedometer/pedometer.dart';

class FirebaseController with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference getUserPhotoCollection() {
    final user = auth.currentUser;
    if (user != null) {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('photos');
    }
    throw Exception('User not logged in');
  }

  Future<void> takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      await uploadPhoto(file);
    }
  }

  Future<void> uploadPhoto(File file) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        String fileName =
            'photos/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        final ref = FirebaseStorage.instance.ref().child(fileName);
        await ref.putFile(file);
        String downloadUrl = await ref.getDownloadURL();

        await getUserPhotoCollection().add({
          'url': downloadUrl,
          'timestamp': Timestamp.now(),
          'userId': user.uid,
        });

        notifyListeners();
      }
    } catch (e) {
      print('Failed to upload photo: $e');
    }
  }

  Future<void> addData({
    required String firstName,
    required String? lastName,
    required String gender,
    required String dob,
    required double weight,
    required double height,
  }) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': user.email,
          'gender': gender,
          'dob': dob,
          'weight': weight,
          'height': height,
        });
      }
    } catch (e) {
      print('Failed to add data: $e');
    }
  }

  Future<Map<String, dynamic>?> fetchUserData() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        return userData.data() as Map<String, dynamic>?;
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    }
    return null;
  }

  // New method to fetch step count data
  Future<int> fetchStepCount() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        // Logic to get step count from pedometer
        Stream<StepCount> stepCountStream = Pedometer.stepCountStream;
        await for (StepCount stepCount in stepCountStream) {
          return stepCount.steps;
        }
      }
    } catch (e) {
      print('Failed to fetch step count: $e');
    }
    return 0;
  }

  Future<void> uploadProfilePhoto(File file) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        String fileName = 'profile_photos/${user.uid}.jpg';
        final ref = FirebaseStorage.instance.ref().child(fileName);
        await ref.putFile(file);
        String downloadUrl = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'profilePhoto': downloadUrl,
        });

        notifyListeners();
      }
    } catch (e) {
      print('Failed to upload profile photo: $e');
    }
  }
}
