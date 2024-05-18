import 'dart:io';

import 'package:habita/src/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IAuthDataSource {
  Session? get currentUserSession;

  Future<UserModel?> getCurrentUserData();

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> updateUser({
    String? name,
    String? email,
    String? password,
    String? oldPassword,
    String? imagePath,
    File? imageFile,
  });

  Future<void> signOut();

  Future<void> deleteAccount({required String email});

  Future<UserModel> getCurrentUser();
}
