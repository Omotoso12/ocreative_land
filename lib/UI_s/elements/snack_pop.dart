import 'package:flutter/material.dart';
import 'package:ocreative_land/widgets/static_color.dart';

SnackBar snackPop (String snackText) {
  return SnackBar(
    elevation: 0,
    backgroundColor: appLightGreen,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0))
    ),
          content: Text(
            snackText,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        );
}
