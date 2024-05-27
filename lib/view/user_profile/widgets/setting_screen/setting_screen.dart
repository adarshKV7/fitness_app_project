// // ignore_for_file: prefer_const_constructors

// import 'package:fitness_app_project/controller/theme_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _heightController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _heightController.dispose();
//     _weightController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeController>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Card(
//               elevation: 4,
//               margin: EdgeInsets.symmetric(vertical: 10),
//               child: ListTile(
//                 leading: Icon(Icons.brightness_6),
//                 title: Text('Dark Mode'),
//                 trailing: Switch(
//                   value: themeProvider.isDarkMode,
//                   onChanged: (value) {
//                     themeProvider.toggleTheme();
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _heightController,
//               decoration: InputDecoration(
//                 labelText: 'Height (cm)',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.height),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _weightController,
//               decoration: InputDecoration(
//                 labelText: 'Weight (kg)',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.fitness_center),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Save user info logic here
//                 String name = _nameController.text;
//                 String height = _heightController.text;
//                 String weight = _weightController.text;
//                 // Perform save operation
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Information Saved'),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text('Save', style: TextStyle(fontSize: 18)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
