import 'package:habita/core/common/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ISettingsDataSource {
  Session? get currentUserSession;
  Future<UserModel> updateUser({
    String? name,
    String? email,
    String? password,
  });
  Future<void> signOut();
}
