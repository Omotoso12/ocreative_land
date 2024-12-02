import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../UI_s/elements/snack_pop.dart';
import '../../repository/auth_repo_provider.dart';

part 'forgot_password_state.dart';

final forgotPasswordProvider =
    StateNotifierProvider.autoDispose<ForgotPasswordController, ForgotPasswordState>(
  (ref) => ForgotPasswordController(
    ref.watch(authRepoProvider),
  ),
);

class ForgotPasswordController extends StateNotifier<ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;

  ForgotPasswordController(this._authenticationRepository)
      : super(const ForgotPasswordState());

  void goToLogin() {
   state = state.copyWith(sent: false);
  }


  Future<void> forgotPassword({required String email, required BuildContext context}) async {
    state = state.copyWith(status: true, sent: false);
    try {
      await _authenticationRepository.forgotPassword(email: email);
      state = state.copyWith(status: false, sent: true);
    } on ForgotPasswordFailure catch (e) {
      state = state.copyWith(
          status: false, errorMessage: e.code);
      final snackBar = snackPop(e.code,);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
