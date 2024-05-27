// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app_project/controller/firebase_controller.dart';
import 'package:fitness_app_project/core/constatns/color_constants.dart';
import 'package:fitness_app_project/view/photo_screen/widgets/view_photo_screen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    final photoController = context.watch<FirebaseController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.pink,
        onPressed: () {
          context.read<FirebaseController>().takePhoto();
        },
        child: Icon(
          FluentIcons.camera_20_regular,
          color: ColorConstants.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Progress Photo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: photoController
            .getUserPhotoCollection()
            .orderBy("timestamp", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: const Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Group photos by date
          Map<String, List<DocumentSnapshot>> photosByDate = {};
          for (var doc in snapshot.data!.docs) {
            DateTime date = (doc['timestamp'] as Timestamp).toDate();
            String formattedDate = DateFormat('yyyy-MM-dd').format(date);
            if (photosByDate[formattedDate] == null) {
              photosByDate[formattedDate] = [];
            }
            photosByDate[formattedDate]!.add(doc);
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: photosByDate.entries.map((entry) {
                  String date = entry.key;
                  List<DocumentSnapshot> photos = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MMMM dd, yyyy')
                            .format(DateTime.parse(date)),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: photos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisExtent: 100,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          var photo = photos[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewPhotoScreen(
                                    photoUrl: photo['url'],
                                    photoId: photo.id,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: photo['url'],
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(photo['url']),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
