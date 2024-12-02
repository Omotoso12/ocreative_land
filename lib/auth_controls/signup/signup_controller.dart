import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import '../../../../repository/auth_repo_provider.dart';
import 'package:authentication_repository/authentication_repository.dart';

import '../../UI_s/elements/snack_pop.dart';
import '../../UI_s/main_entry/buttom.dart';

part 'signup_state.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
  (ref) => SignUpController(ref.watch(authRepoProvider)),
);

class SignUpController extends StateNotifier<SignUpState> {
  final AuthenticationRepository _authenticationRepository;
  SignUpController(this._authenticationRepository) : super(const SignUpState());

  void signUpWithEmailAndPassword({required String email, required String password, required BuildContext context}) async {
    state = state.copyWith(status: true);
    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      state = state.copyWith(status: false);

       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: false, errorMessage: e.code);
       final snackBar = snackPop(e.code,);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
