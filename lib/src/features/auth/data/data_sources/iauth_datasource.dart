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
    required String name,
    required String email,
    required String password,
    required String oldPassword,
  });
  Future<void> signOut();
  
  Future<UserModel> getCurrentUser();
}
