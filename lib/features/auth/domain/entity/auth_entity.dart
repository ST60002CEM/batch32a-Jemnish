import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String fullname;
  final String? image;
  final String phone;
  final String username;
  final String password;

  const AuthEntity({
    this.id,
    required this.fullname,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [id, fullname, image, phone, username, password];
}
