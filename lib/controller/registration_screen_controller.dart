// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';

import 'package:flutter/material.dart';

class RegistraionScreeenController with ChangeNotifier {
  bool isLoading = false;
  Future<bool> register(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        isLoading = false;
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        isLoading = false;
        notifyListeners();
        return false;
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorConstants.red,
            content: Text("The account alredy exists for that email")));
        isLoading = false;
        notifyListeners();
        return false;
        // print('The account already exists for that email.');
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
    isLoading = false;
    notifyListeners();
    return false;
  }
}
