part of 'forgot_password_controller.dart';

class ForgotPasswordState extends Equatable {
  final String email;
  final bool status;
  final bool sent;
  final String? errorMessage;

  const ForgotPasswordState({
    this.email = '',
    this.status = false,
    this.sent = false, 
    this.errorMessage,
  });

  ForgotPasswordState copyWith({
    String? email,
    bool? status,
    bool? sent,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      sent: sent ?? this.sent,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        email,
        status,
        sent,
      ];
}
