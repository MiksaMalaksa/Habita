import 'package:habita/core/common/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ISettingsDataSource {
  Session? get currentUserSession;
  Future<UserModel> updateUser({
    required String name,
    required String email,
   required  String password,
  });
  Future<void> signOut();
  Future<UserModel> getCurrentUser();
}
