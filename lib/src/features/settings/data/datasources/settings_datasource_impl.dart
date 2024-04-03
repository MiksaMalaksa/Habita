import 'package:habita/core/common/models/user_model.dart';
import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/src/features/settings/data/datasources/isettings_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//!Запросить смену пароля
//!Google auth
//!хранить фотку в датабазе

class SettingsDataSourceImpl implements ISettingsDataSource {
  final SupabaseClient client;
  const SettingsDataSourceImpl({required this.client});

  @override
  Session? get currentUserSession => client.auth.currentSession;

  @override
  Future<void> signOut() async {
    await client.auth.signOut();
  }

  @override
  Future<UserModel> updateUser(
      {String? name, String? email, String? password}) async {
    try {
      //!Позже поменять парольную составляющую
      final response = await client.auth.updateUser(
          UserAttributes(email: email ?? currentUserSession!.user.email,password: password));

      if (response.user == null) {
        throw ServerException(message: 'Something went wrong');
      }

      final UserModel user = UserModel.fromMap(response.user!.toJson());
      return user;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
