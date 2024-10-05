part of 'signin_controller.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool status;
  final String? errorMessage;

  const SignInState({
    this.email = '',
    this.password = '',
    this.status = false,
    this.errorMessage,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? status,
    bool? buttonTapped,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
      ];
}
