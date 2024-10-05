import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authentication_repository/authentication_repository.dart';
import '../../../repository/auth_repo_provider.dart';
part 'signin_state.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
  (ref) => SignInController(ref.watch(authRepoProvider)),
);

class SignInController extends StateNotifier<SignInState> {
  final AuthenticationRepository _authenticationRepository;
  SignInController(this._authenticationRepository) : super(const SignInState());


  void signInWithEmailAndPassword() async {
    state = state.copyWith(status: true);
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      state = state.copyWith(status: false);
    } on SignInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: false, errorMessage: e.code);
    }
  }
}
