import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocreative_land/UI_s/main_entry/profile/pic_uploader.dart';
import 'package:ocreative_land/UI_s/main_entry/profile/settings.dart';
import 'package:ocreative_land/auth_controls/storage_controller.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late File? image;
  String? imagePath;
  String? imageName;
  String? avatarUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
            ]),
        body: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container(
                  padding: const EdgeInsets.only(
                    left: 14,
                    top: 25,
                    right: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(children: [
// my profiling header
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.white,
                          width: 80,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
// picture box
                      Center(
                        child: Stack(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
// full name
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: textCustoms('', '', false),
                      ),
// email
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: textCustoms('', '', false)),
// password
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: textCustoms('', '', false)),
// location
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: textCustoms('', '', false)),
                    ]),
                  ));
            } else {
              return Container(
                  padding: const EdgeInsets.only(
                    left: 14,
                    top: 25,
                    right: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(children: [
// my profiling header
                      const Text(
                        'My Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
// picture box
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                // image: DecorationImage(

                                //     fit: BoxFit.fill, image: null
                                //     ),
                                border: Border.all(
                                    width: 4,
                                    color:
                                        const Color.fromARGB(255, 127, 30, 30)),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 49, 30, 127)),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    getImageFromGallery();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ]),
                  ));
            }
          },
        ));
  }

  bool isEye = true;

  Widget textCustoms(
    String firstText,
    String secondText,
    bool isPassword,
  ) {
    return isPassword
        ? Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Text(
                          firstText,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, bottom: 16, top: 8),
                        child:
                            isEye ? const Text('*********') : Text(secondText),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 16, top: 8),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            isEye = !isEye;
                          });
                        },
                        icon: isEye
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined)),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Text(
                      firstText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 16, top: 8),
                    child: Text(secondText),
                  ),
                ],
              ),
            ),
          );
  }

  final storageController = StorageController();

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    // await FirebaseFirestore.instance
    //     .collection('USERS')
    //     .doc(firebaseUser.uid)
    //     .get()
    //     .then((userDoc) {
    //   final userData = userDoc.data();
    //   sample = userData;
    // });

    String avaUrl =
        await storageController.getUserDownloadUrl(firebaseUser.uid);
    avatarUrl = avaUrl;
  }

  void getImageFromGallery() async {
    FilePickerResult? pickerFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    setState(() {
      if (pickerFile != null) {
        image = File(pickerFile.paths.first as String);
        imagePath = pickerFile.files.single.path;
        imageName = pickerFile.files.single.name;
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UploadPicture(
          image: image,
          imagePath: imagePath as String,
        );
      }));
    });
  }
}
