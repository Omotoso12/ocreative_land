import 'package:flutter/material.dart';
import 'package:ocreative_land/widgets/form_widgets.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      actions: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: SearchField(
            controller: _searchController,
            afocus: true,
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    ));
  }
}
