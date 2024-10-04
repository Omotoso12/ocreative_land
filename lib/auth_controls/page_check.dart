import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocreative_land/UI_s/main_entry/buttom.dart';
import 'package:ocreative_land/UI_s/started.dart';

class PageChecker extends StatelessWidget {
  const PageChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNav();
          } else {
            return const Started();
          }
        },
      ),
    );
  }
}
