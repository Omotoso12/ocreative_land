import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageController {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final firebaseUser = FirebaseAuth.instance.currentUser!;

  Future<void> uploadFile(String imagePath) async {
    File file = File(imagePath);

    try {
      await storage.ref('user/profile/${firebaseUser.uid}').putFile(file);
      // ignore: unused_catch_clause
    } on firebase_core.FirebaseException catch (e) {
      return;
    }
  }

  Future<String> getUserDownloadUrl(String uid) async {
    final storageRef = storage.ref().child("user/profile/$uid");
    return storageRef.getDownloadURL();
  }
}
