import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ocreative_land/UI_s/main_entry/buttom.dart';

class AuthController {
  /* variables needed */
  var isLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  /// creating Login method ............................................///
  Future login(
      {String? email, String? password, required BuildContext context}) async {
    isLoading = true;

    auth
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      isLoading = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    }).catchError((e) {
      isLoading = false;
      final snackBar = SnackBar(
        content: Text(
          '$e',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  /// creating  registering with google method.........................///
  Future signInWithGoogle({required BuildContext context}) async {
    isLoading = true;

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        isLoading = false;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const BottomNav();
        }));
      }).catchError((e) {
        isLoading = false;
        final snackBar = SnackBar(
          content: Text(
            '$e',
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  /// creating signup with email and password............................///
  void signUp(
      {String? email, String? password, required BuildContext context}) {
    isLoading = true;

    auth
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      isLoading = false;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    }).catchError((e) {
      isLoading = false;
      final snackBar = SnackBar(
        content: Text(
          '$e',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  /// creating forget password method.......................................///
  void forgetPassord({String? email, required BuildContext context}) {
    isLoading = true;

    auth.sendPasswordResetEmail(email: email!).then((value) {
      isLoading = false;
      const snackBar = SnackBar(
        content: Text(
          'check your gmail to continue',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((e) {
      isLoading = false;
      final snackBar = SnackBar(
        content: Text(
          '$e',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
