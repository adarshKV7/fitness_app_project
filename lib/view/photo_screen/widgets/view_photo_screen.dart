// ignore_for_file: use_build_context_synchronously, avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ViewPhotoScreen extends StatelessWidget {
  final String photoUrl;
  final String photoId;

  const ViewPhotoScreen({
    Key? key,
    required this.photoUrl,
    required this.photoId,
  }) : super(key: key);

  Future<void> deletePhoto(BuildContext context) async {
    try {
      // Delete photo from Firebase Storage
      final ref = FirebaseStorage.instance.refFromURL(photoUrl);
      await ref.delete();

      // Delete photo document from Firestore
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('photos')
            .doc(photoId)
            .delete();
      }

      Navigator.pop(context);
    } catch (e) {
      print('Failed to delete photo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => deletePhoto(context),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Hero(
                  tag: photoUrl,
                  child: Image.network(
                    photoUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
