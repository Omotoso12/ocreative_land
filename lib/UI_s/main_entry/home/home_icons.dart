import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocreative_land/auth_controls/controller/authentication_controller.dart';
import 'package:ocreative_land/my_app.dart';
import 'package:ocreative_land/widgets/static_color.dart';

class HomeIcons extends ConsumerStatefulWidget {
  const HomeIcons({super.key});

  @override
  ConsumerState<HomeIcons> createState() => _HomeIconsState();
}


class _HomeIconsState extends ConsumerState<HomeIcons> {
    // instamt initialization //
  @override
  void initState() {
    ref.read(authProvider.notifier);
    super.initState();
  }
  @override
  Widget build(BuildContext context,) {
    final logOut = ref.read(authProvider.notifier);
    return Row(
      children: [
        IconButton(
          color: appLightGreen,
          onPressed: () {
            setState(() {
              logOut.onSignOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const MyApp();
              }));
            });
          },
            
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
