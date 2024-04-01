import 'dart:convert';
import 'package:habita/core/common/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  //*to_map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  //*from_map
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? 'emil',
      name: map['name'] ?? '');

  //*to_string_source
  String toJson() => jsonEncode(toMap());

  //*from_json_source
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  //*to_model
  factory UserModel.toModel(User user) =>
      UserModel(email: user.email, id: user.id, name: user.name);

  UserModel copyWith({String? id, String? email, String? name}) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}
