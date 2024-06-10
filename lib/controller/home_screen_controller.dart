// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:fitness_app_project/model/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<CarosalModel> carosalModelList = [];
  final List<Map<String, String>> healthTips = [
    {
      'text': 'Drink plenty of water to stay hydrated.',
      'url':
          'https://www.healthline.com/nutrition/how-much-water-should-you-drink-per-day',
      'image': "assets/images/background.jpg",
    },
    {
      'text': 'Exercise regularly to maintain your health.',
      'url': 'https://www.cdc.gov/physicalactivity/basics/pa-health/index.htm',
      'image': "assets/images/love.jpg",
    },
    {
      'text': 'Eat a balanced diet rich in nutrients.',
      'url':
          'https://www.hsph.harvard.edu/nutritionsource/what-should-you-eat/healthy-eating-plate/',
      'image': "assets/images/food.jpg",
    },
  ];

  convertToModel() {
    carosalModelList = healthTips
        .map((e) =>
            CarosalModel(image: e['image'], text: e['text'], url: e['url']))
        .toList();
    //   carosalModelList = healthTips.map((e) => CarosalModel.fromJson(e)).toList();
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
