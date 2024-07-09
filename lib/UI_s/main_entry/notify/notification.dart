import 'package:flutter/material.dart';
import 'package:ocreative_land/widgets/static_color.dart';

class NoterPage extends StatefulWidget {
  const NoterPage({super.key});

  @override
  State<NoterPage> createState() => _NoterPageState();
}

class _NoterPageState extends State<NoterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Clear all',
                style: TextStyle(color: appLightGreen, fontSize: 12),
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Notifications',
                    style: TextStyle(
                        color: appBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/notify.png',
                ),
                const Text(
                  'No alert yet',
                  style: TextStyle(color: appBlack, fontSize: 12),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
