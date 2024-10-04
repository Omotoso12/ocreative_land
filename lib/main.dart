import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDnKTEeUh45kw0CjMl0rNGyLSZff3SXVWA",
        appId: '1:60779607090:android:64f65af4375d8cd052782b',
        messagingSenderId: '60779607090',
        projectId: 'ocreativeland'),
  );
  runApp(const ProviderScope(
    child: MyApp()
  ) 
  );
}
