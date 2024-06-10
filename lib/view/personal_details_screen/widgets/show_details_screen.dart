import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/view/personal_details_screen/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/controller/firebase_controller.dart'; // import the controller

class ShowDetailsScreen extends StatefulWidget {
  const ShowDetailsScreen({super.key});

  @override
  State<ShowDetailsScreen> createState() => _ShowDetailsScreenState();
}

class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
  final FirebaseController firebaseController = FirebaseController();

  String name = "";
  String gender = "";
  double height = 0.0;
  double weight = 0.0;
  String dob = "";

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userData = await firebaseController.fetchUserData();
    if (userData != null) {
      setState(() {
        name = "${userData['firstName']} ${userData['lastName']}";
        gender = userData['gender'];
        height = userData['height'];
        weight = userData['weight'];
        dob = userData['dob'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Be Fit",
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'Sedgwick',
              fontWeight: FontWeight.bold,
              color: ColorConstants.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InfoCard(
              label: 'Name',
              value: name,
              icon: Icons.person,
            ),
            SizedBox(height: 10),
            InfoCard(
              label: 'Gender',
              value: gender,
              icon: Icons.wc,
            ),
            SizedBox(height: 10),
            InfoCard(
              label: 'Height',
              value: '${height.toString()} cm',
              icon: Icons.height,
            ),
            SizedBox(height: 10),
            InfoCard(
              label: 'Weight',
              value: '${weight.toString()} kg',
              icon: Icons.fitness_center,
            ),
            SizedBox(height: 10),
            InfoCard(
              label: 'Dob',
              value: dob,
              icon: Icons.cake,
            ),
          ],
        ),
      ),
    );
  }
}







// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

// import 'package:fitness_app_project/core/constatns/color_constants.dart';
// import 'package:fitness_app_project/view/personal_details_screen/widgets/info_card.dart';
// import 'package:flutter/material.dart';

// class ShowDetailsScreen extends StatefulWidget {
//   const ShowDetailsScreen({super.key});

//   @override
//   State<ShowDetailsScreen> createState() => _ShowDetailsScreenState();
// }

// class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Be Fit",
//           style: TextStyle(
//               fontSize: 30,
//               fontFamily: 'Sedgwick',
//               fontWeight: FontWeight.bold,
//               color: ColorConstants.red),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             InfoCard(
//               label: 'Name',
//               value: "",
//               icon: Icons.person,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Gender',
//               value: "",
//               icon: Icons.wc,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Height',
//               value: '${"".toString()} cm',
//               icon: Icons.height,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Weight',
//               value: '${"".toString()} kg',
//               icon: Icons.fitness_center,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Age',
//               value: "".toString(),
//               icon: Icons.cake,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: prefer_const_constructors

// import 'package:fitness_app_project/core/constatns/color_constants.dart';
// import 'package:fitness_app_project/view/personal_details_screen/widgets/info_card.dart';
// import 'package:fluentui_system_icons/fluentui_system_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:fitness_app_project/controller/firebase_controller.dart'; // import the controller

// class ShowDetailsScreen extends StatefulWidget {
//   const ShowDetailsScreen({super.key});

//   @override
//   State<ShowDetailsScreen> createState() => _ShowDetailsScreenState();
// }

// class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
//   final FirebaseController _firebaseController = FirebaseController();

//   String name = "";
//   String gender = "";
//   double height = 0.0;
//   double weight = 0.0;
//   String dob = "";

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     final userData = await _firebaseController.fetchUserData();
//     if (userData != null) {
//       setState(() {
//         name = "${userData['firstName']} ${userData['lastName']}";
//         gender = userData['gender'];
//         height = userData['height'];
//         weight = userData['weight'];
//         dob = userData['dob'];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Be Fit",
//           style: TextStyle(
//               fontSize: 30,
//               fontFamily: 'Sedgwick',
//               fontWeight: FontWeight.bold,
//               color: ColorConstants.red),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 50,
//               child: Icon(
//                 FluentIcons.person_16_filled,
//                 size: 40,
//               ),
//             ),
//             InfoCard(
//               label: 'Name',
//               value: name,
//               icon: Icons.person,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Gender',
//               value: gender,
//               icon: Icons.wc,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Height',
//               value: '${height.toString()} m',
//               icon: Icons.height,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Weight',
//               value: '${weight.toString()} kg',
//               icon: Icons.fitness_center,
//             ),
//             SizedBox(height: 10),
//             InfoCard(
//               label: 'Dob',
//               value: dob,
//               icon: Icons.cake,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

