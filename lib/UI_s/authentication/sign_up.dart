import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocreative_land/auth_controls/auth_controller.dart';
import 'package:ocreative_land/widgets/string.dart';
import 'package:ocreative_land/widgets/form_widgets.dart';

import '../../auth_controls/google_signin/google_signin_controller.dart';
import '../../auth_controls/signup/signup_controller.dart';
import 'sign_in.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  /* variables needed
  formkey
  controllers
  authentication controller */
  final GlobalKey<FormState> _signKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool visibleText = true;
  bool visibleText1 = true;

  // handling the removal of input text //
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // instamt initialization //
  @override
  void initState() {
    ref.read(signUpProvider.notifier);
    ref.read(googleSignInProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    final signUpController = ref.read(signUpProvider.notifier);
    final gooleSignUp = ref.read(googleSignInProvider.notifier);
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // app logo..................................................................................//
            Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            ),

            Form(
                key: _signKey,
                child: Column(
                  children: <Widget>[
                    // email input field......................................................................//
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0),
                        child: MailFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || !value.isValidEmail) {
                                return 'Please enter a valid email address';
                              }
                              return null; // Return null if validation
                            })),

                    //password input field......................................................................//
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MyPassFormField(
                        leb: 'password',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || !value.isValidPassword) {
                            return 'password must contain character,\nuppercase,lowercase,number.';
                          }
                          if (value.characters.length <= 6) {
                            return 'password must be more than six';
                          }
                          return null; // Return null if validation
                        },
                        obscure: visibleText,
                        iconTapped: () {
                          setState(() {
                            visibleText = !visibleText;
                          });
                        },
                      ),
                    ),

                    // password confirmation input field......................................................................//
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16.0, left: 16.0, right: 16.0),
                      child: MyPassFormField(
                        leb: 'confirm password',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null ||
                              value != _passwordController.text.trim()) {
                            return 'password does not match';
                          }
                          return null; // Return null if validation
                        },
                        obscure: visibleText1,
                        iconTapped: () {
                          setState(() {
                            visibleText1 = !visibleText1;
                          });
                        },
                      ),
                    ),
                    // sign up button..........................................................................//
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_signKey.currentState!.validate()) {
                            signUpController.signUpWithEmailAndPassword(
                                context: context,
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width, 50),
                            backgroundColor:
                                const Color.fromARGB(225, 89, 142, 81),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: (!authController.isLoading)
                            ? const Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                )),

            // google sign up button......................................................................//
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text('with'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'assets/line.png',
                      height: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      gooleSignUp.signInWithGoogle();
                    },
                    child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        child: Image.asset(
                          'assets/google.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
            ),

            // navigating page button......................................................................//
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignIn();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(225, 89, 142, 81),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
              ],
            )
          ]),
    )));
  }
}
