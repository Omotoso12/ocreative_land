import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ocreative_land/UI_s/main_entry/profile/profile.dart';
import 'package:ocreative_land/auth_controls/storage_controller.dart';

class UploadPicture extends StatelessWidget {
  const UploadPicture(
      {super.key, required this.image, required this.imagePath});

  final File? image;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final storageController = StorageController();
    return Scaffold(
      appBar: AppBar(),
      body: image != null
          ? Container(
              padding: const EdgeInsets.all(10),
              child: Image.file(
                image!,
                fit: BoxFit.cover,
              ),
            )
          : Container(),
      floatingActionButton: FloatingActionButton(
          child: const Text('Use'),
          onPressed: () {
            storageController.uploadFile(imagePath).then((value) {
              const ScaffoldMessenger(child: Text('Image uploaded'));
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return const ProfilePage();
              }), (route) => false);
            });
          }),
    );
  }
}
