import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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


  Future<void> forgotPassword() async {
    state = state.copyWith(status: true);
    try {
      await _authenticationRepository.forgotPassword(email: state.email);
      state = state.copyWith(status: false);
    } on ForgotPasswordFailure catch (e) {
      state = state.copyWith(
          status: false, errorMessage: e.code);
    }
  }
}
