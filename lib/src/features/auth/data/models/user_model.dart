import 'dart:convert';

import 'package:habita/src/features/auth/domain/entities/user.dart';

class UserModel extends SupaUser {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    super.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'image_path': imagePath,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] ?? '',
        email: map['email'] ?? 'email',
        name: map['name'] ?? '',
        imagePath: map['image_path'],
      );

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  factory UserModel.toModel(SupaUser user) => UserModel(
      email: user.email,
      id: user.id,
      name: user.name,
      imagePath: user.imagePath);

  UserModel copyWith(
      {String? id, String? email, String? name, String? imagePath}) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
