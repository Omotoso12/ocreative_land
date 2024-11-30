import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:ocreative_land/UI_s/elements/snack_pop.dart';
import '../../../repository/auth_repo_provider.dart';
part 'signin_state.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
  (ref) => SignInController(ref.watch(authRepoProvider)),
);

class SignInController extends StateNotifier<SignInState> {
  final AuthenticationRepository _authenticationRepository;
  SignInController(this._authenticationRepository) : super(const SignInState());


  void signInWithEmailAndPassword({required String email, required String password, required BuildContext context}) async {
    state = state.copyWith(status: true);
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = state.copyWith(status: false);
    } on SignInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: false, errorMessage: e.code);
      final snackBar = snackPop(e.code,);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
