import 'dart:convert';

class User {
  final String id;
  final String email;
  final String phoneNumber;
  final String password;

  const User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toMap());
  }
}
