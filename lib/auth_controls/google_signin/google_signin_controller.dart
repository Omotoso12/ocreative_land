import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../UI_s/main_entry/buttom.dart';
import '../../repository/auth_repo_provider.dart';

final googleSignInProvider =
    StateNotifierProvider<GoogleSignInController, GoogleSignInState>(
  (ref) {
    final authenticationRepository = ref.watch(authRepoProvider);
    return GoogleSignInController(authenticationRepository);
  },
);

enum GoogleSignInState {
  initial,
  loading,
  success,
  error,
}

class GoogleSignInController extends StateNotifier<GoogleSignInState> {
  final AuthenticationRepository _authenticationRepository;

  GoogleSignInController(this._authenticationRepository)
      : super(GoogleSignInState.initial);

  Future<void> signInWithGoogle(BuildContext context) async {
    state = GoogleSignInState.loading;

    try {
      final isNewUser = await _authenticationRepository.signInWithGoogle();

      if (isNewUser != null && isNewUser) {}

      state = GoogleSignInState.success;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    } on SignInWithGoogleFailure catch (_) {
      state = GoogleSignInState.error;
    }
  }
}
