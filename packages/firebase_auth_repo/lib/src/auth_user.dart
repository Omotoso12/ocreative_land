import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String? email;
  final String? name;
 

  const AuthUser({
    required this.id,
    this.email,
    this.name,
  });

  static const empty = AuthUser(id: '');

  bool get isEmpty => this == AuthUser.empty;

  @override
  List<Object?> get props => [
        email,
        id,
        name,
      ];
}
