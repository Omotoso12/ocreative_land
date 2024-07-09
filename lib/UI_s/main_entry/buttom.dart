import 'package:flutter/material.dart';
import 'package:ocreative_land/UI_s/main_entry/home/home.dart';
import 'package:ocreative_land/UI_s/main_entry/profile/profile.dart';
import 'package:ocreative_land/UI_s/main_entry/search/search.dart';
import 'package:ocreative_land/widgets/static_color.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  bool home = false;
  bool search = false;
  bool profile = false;

  int currentIndex = 0;

  void tap(int index) {
    setState(() {
      currentIndex = index;

      if (currentIndex == 0) {
        setState(() {
          home = true;
          search = false;
          profile = false;
        });
      } else if (currentIndex == 1) {
        setState(() {
          home = false;
          search = true;
          profile = false;
        });
      } else if (currentIndex == 2) {
        setState(() {
          home = false;
          search = false;
          profile = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 2, color: appLightGreen))),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              onTap: tap,
              currentIndex: currentIndex,
              selectedItemColor: appLightGreen,
              unselectedItemColor: appLightGreen,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: home
                        ? const Icon(Icons.home)
                        : const Icon(Icons.home_outlined),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: search
                        ? const Icon(Icons.saved_search_rounded)
                        : const Icon(Icons.search),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: profile
                        ? const Icon(Icons.person)
                        : const Icon(Icons.person_outline),
                    label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
