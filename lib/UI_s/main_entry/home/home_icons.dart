import 'package:flutter/material.dart';
import 'package:ocreative_land/widgets/static_color.dart';

class HomeIcons extends StatefulWidget {
  const HomeIcons({super.key});

  @override
  State<HomeIcons> createState() => _HomeIconsState();
}

class _HomeIconsState extends State<HomeIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: appLightGreen,
          onPressed: () {},
          icon: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              const Icon(Icons.notifications_active),
              Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: appRed,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: appWhite,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside)),
                  child: const Center(
                      child: Text(
                    '1',
                    style: TextStyle(
                        color: appWhite,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ))),
            ],
          ),
        ),
        IconButton(
            color: appLightGreen,
            onPressed: () {},
            icon: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                const Icon(Icons.shopping_cart),
                Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: appRed,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: appWhite,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignOutside)),
                    child: const Center(
                        child: Text(
                      '1',
                      style: TextStyle(
                          color: appWhite,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                    ))),
              ],
            )),
      ],
    );
  }
}
