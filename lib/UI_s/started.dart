import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ocreative_land/widgets/static_color.dart';
import 'authentication/login.dart';

class Started extends StatefulWidget {
  const Started({super.key});

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // intro................................................................................
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        child: const FittedBox(
                            child: Text(
                          'WELCOME',
                          style: TextStyle(
                            fontFamily: 'whoa-sauce-personal-use',
                            color: appLightGreen,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),

                      // cover image........................................................................................

                      Image.asset(
                        'assets/cover.png',
                      ),

                      // descriptions......................................................................................
                      const Text(
                        'we walk you through your journey \n of buying  your food stalk and \n ingredient with ease',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appLightGreen,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),

                      const Text(
                        '>>>',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appLightGreen,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                // get started button.............................................................................

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Login();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 50),
                        backgroundColor: appLightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'GET STARTED',
                          style: TextStyle(
                              color: appWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Image.asset(
                            'assets/rocket.png',
                            scale: sqrt2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
