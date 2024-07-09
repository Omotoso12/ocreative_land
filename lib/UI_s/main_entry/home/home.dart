import 'package:flutter/material.dart';
import 'package:ocreative_land/UI_s/main_entry/home/home_icons.dart';
import 'package:ocreative_land/UI_s/main_entry/home/home_side_scroll_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: const <Widget>[HomeIcons()],
        ),
        body: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeSideScroll(),
            ),
            SliverToBoxAdapter(
              child: Divider(
                indent: 12.0,
                endIndent: 12.0,
              ),
            ),
          ],
        ));
  }
}
