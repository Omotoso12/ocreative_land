import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocreative_land/auth_controls/forgot_password/forgot_password_controller.dart';
import 'package:ocreative_land/widgets/string.dart';
import '../../widgets/form_widgets.dart';

class ForgetPassord extends ConsumerStatefulWidget {
  const ForgetPassord({super.key});

  @override
  ConsumerState<ForgetPassord> createState() => _ForgetPassordState();
}

class _ForgetPassordState extends ConsumerState<ForgetPassord> {
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
    ref.read(forgotPasswordProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final forgotPassController = ref.read(forgotPasswordProvider.notifier);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                    (ref.watch(forgotPasswordProvider).sent)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                               forgotPassController.goToLogin();
                               Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize:
                                      Size(MediaQuery.sizeOf(context).width, 50),
                                  backgroundColor:
                                      const Color.fromARGB(225, 89, 142, 81),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                'Go to Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (_forgetKey.currentState!.validate()) {
                                  forgotPassController.forgotPassword(
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
                              child: (ref.watch(forgotPasswordProvider).status)?
                              const Center(child: CircularProgressIndicator())
                              :const Text(
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
      ),
    );
  }
}
