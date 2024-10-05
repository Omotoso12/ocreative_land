part of "signup_controller.dart";

class SignUpState extends Equatable {
  final String email;
  final String password;
  final bool status;
  final String? errorMessage;

  const SignUpState({ 
    this.email = '',
    this.password = '',
    this.status = false,
    this.errorMessage,
  });

  SignUpState copyWith({
    String? email,
    String? password,
    bool? status,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
      ];
}
