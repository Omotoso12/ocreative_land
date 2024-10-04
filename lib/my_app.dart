import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocreative_land/UI_s/main_entry/buttom.dart';
import 'package:ocreative_land/UI_s/started.dart';
import 'package:ocreative_land/auth_controls/controller/authentication_controller.dart';


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authenticationState = ref.watch(authProvider);

    Widget getHome() {
      if (authenticationState.status == AuthenticationStatus.authenticated) {
        return const BottomNav();
      } else if (authenticationState.status ==
          AuthenticationStatus.unauthenticated) {
        return const Started();
      } else {
        return const Started();
      }
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ocreactive land',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: getHome(),
    );
  }
}
