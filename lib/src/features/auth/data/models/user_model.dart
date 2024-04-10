import 'dart:convert';

import 'package:habita/src/features/auth/domain/entities/user.dart';

class UserModel extends SupaUser {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? 'emil',
      name: map['name'] ?? '');

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  factory UserModel.toModel(SupaUser user) =>
      UserModel(email: user.email, id: user.id, name: user.name);

  UserModel copyWith({String? id, String? email, String? name}) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}
