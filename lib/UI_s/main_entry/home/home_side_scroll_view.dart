import 'package:flutter/material.dart';

class HomeSideScroll extends StatefulWidget {
  const HomeSideScroll({super.key});

  @override
  State<HomeSideScroll> createState() => _HomeSideScrollState();
}

class _HomeSideScrollState extends State<HomeSideScroll> {
  PageController? _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: const Text(
            'Most Popular',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 300.0,
          child: PageView.builder(
              padEnds: false,
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 79, 56),
                    borderRadius: BorderRadius.circular(10.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       color: Colors.black,
                    //       offset: Offset(0, 2),
                    //       blurRadius: 6.0)
                    // ]
                  ),
                );
              }),
        )
      ],
    );
  }
}
