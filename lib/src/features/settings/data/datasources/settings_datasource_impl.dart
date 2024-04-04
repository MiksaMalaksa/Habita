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
    try {
      await client.auth.signOut();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> updateUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      //!Позже поменять парольную составляющую
      final response = await client.auth.updateUser(UserAttributes(
          email: email.isEmpty ? currentUserSession!.user.email : email,
          data: {
            'name': name.isEmpty
                ? currentUserSession!.user.userMetadata!['name']
                : name
          }));

      if (response.user == null) {
        throw ServerException(message: 'Something went wrong');
      }

      final UserModel user = UserModel.fromMap(response.user!.toJson());
      return user;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  //!no need of future
  Future<UserModel> getCurrentUser() async {
    try {
      final response = client.auth.currentUser;

      if (response == null) {
        throw ServerException(message: 'Something went wrong');
      }

      final UserModel user = UserModel.fromMap(response.toJson())
          .copyWith(name: response.userMetadata!['name']);
      return user;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
