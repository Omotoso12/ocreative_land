import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import '../../../../repository/auth_repo_provider.dart';
import 'package:authentication_repository/authentication_repository.dart';

part 'signup_state.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
  (ref) => SignUpController(ref.watch(authRepoProvider)),
);

class SignUpController extends StateNotifier<SignUpState> {
  final AuthenticationRepository _authenticationRepository;
  SignUpController(this._authenticationRepository) : super(const SignUpState());

  void signUpWithEmailAndPassword() async {
    state = state.copyWith(status: true);
    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      state = state.copyWith(status: false);
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: false, errorMessage: e.code);
    }
  }
}
