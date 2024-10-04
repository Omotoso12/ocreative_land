import 'package:flutter/material.dart';
import 'package:ocreative_land/widgets/string.dart';
import '../../auth_controls/auth_controller.dart';
import '../../widgets/form_widgets.dart';

class ForgetPassord extends StatefulWidget {
  const ForgetPassord({super.key});

  @override
  State<ForgetPassord> createState() => _ForgetPassordState();
}

class _ForgetPassordState extends State<ForgetPassord> {
  /* variables needed
  formkey
  controllers
  authentication controller */
  final GlobalKey<FormState> _forgetKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  // handling the removal of input text //
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // instamt initialization //
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: const Color.fromARGB(255, 89, 142, 81),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
          child: SizedBox(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 32,
                      color: Color.fromARGB(255, 89, 142, 81),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _forgetKey,
              child: Column(
                children: [
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
                  (authController.isLoading)
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_forgetKey.currentState!.validate()) {
                                authController.forgetPassord(
                                    email: _emailController.text.trim(),
                                    context: context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize:
                                    Size(MediaQuery.sizeOf(context).width, 50),
                                backgroundColor:
                                    const Color.fromARGB(225, 89, 142, 81),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              'Get link',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
