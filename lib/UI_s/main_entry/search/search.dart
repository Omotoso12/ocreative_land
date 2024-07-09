import 'package:flutter/material.dart';
import 'package:ocreative_land/UI_s/main_entry/search/search_box.dart';
import 'package:ocreative_land/widgets/static_color.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // @override
  // void dispose(){
  //   _searchController.dispose();
  //   super.dispoe();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchBox();
                }));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.sizeOf(context).width * 0.025),
                child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    height: 39,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: appLightGreen, width: 2.0)),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Quick search commodities',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
          title: const Text('')),
      body: const Center(
        child: Text('Search page'),
      ),
    );
  }
}
