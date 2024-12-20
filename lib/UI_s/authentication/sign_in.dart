import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocreative_land/UI_s/authentication/sign_up.dart';
import 'package:ocreative_land/auth_controls/google_signin/google_signin_controller.dart';
import 'package:ocreative_land/widgets/string.dart';
import 'package:ocreative_land/widgets/form_widgets.dart';

import '../../auth_controls/signin/signin_controller.dart';
import 'forget_pass.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  /* variables needed
  formkey
  controllers
  authentication controller */
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool visibleText = true;

  // handling the removal of input text //
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // instamt initialization //
  @override
  void initState() {
    ref.read(signInProvider.notifier);
    ref.read(googleSignInProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInController = ref.read(signInProvider.notifier);
    final gooleSignIn = ref.read(googleSignInProvider.notifier);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: SafeArea(
              child: Center(
        child: Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // app logo..................................................................................//
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
            
                  Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          // email input field......................................................................//
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: MailFormField(
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value == null || !value.isValidEmail) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null; // Return null if validation
                                  })),
            
                          // password input field......................................................................//
            
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
            
                          // forget password button......................................................................//
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const ForgetPassord();
                                      }));
                                    },
                                    child: const Text(
                                      'Forget Password?',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ],
                            ),
                          ),
                          // sign in button...................................................................
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (_formkey.currentState!.validate()) {
                                  signInController.signInWithEmailAndPassword(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                      context: context
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize:
                                      Size(MediaQuery.sizeOf(context).width, 50),
                                  backgroundColor:
                                      const Color.fromARGB(225, 89, 142, 81),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: (!ref.watch(signInProvider).status)
                                  ? const Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator.adaptive()),
                            ),
                          ),
                        ],
                      )),
            
                  // google sign in button......................................................................//
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
                            gooleSignIn.signInWithGoogle(context);
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
                      const Text('Don\'t have an account?'),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignUp();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(225, 89, 142, 81),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  )
                ]),
      
                // if ( ) Container(
                //   width: MediaQuery.sizeOf(context).width,
                //   height: MediaQuery.sizeOf(context).height,
                //   color: const Color.fromARGB(255, 230, 38, 38).withOpacity(0.3),
                //   child: const Center(
                //     child: Center(child: CircularProgressIndicator()),
                //   )
                // ),
          ],
        ),
      ))),
    );
  }
}
