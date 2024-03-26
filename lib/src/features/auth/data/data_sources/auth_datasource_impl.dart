import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:habita/src/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDatasourceImpl implements IAuthDataSource {
  final SupabaseClient client;
  const AuthDatasourceImpl({required this.client});

  @override
  Session? get currentUserSession => client.auth.currentSession;

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }

      return UserModel.fromMap(response.user!.toJson())
        ..copyWith(email: currentUserSession!.user.email);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );

      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }

      return UserModel.fromMap(response.user!.toJson())
        ..copyWith(email: currentUserSession!.user.email);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      //*can select specified fields by enumerating them: 'name', 'id', select by
      //*default select all(get all data)
      //*eq specifies a user we want
      //*session - primary unique identifier
      //!If the user is plugged in current session would not be null
      if (currentUserSession != null) {
        final result = await client
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);
        return UserModel.fromMap(result.first)
            .copyWith(email: currentUserSession!.user.email);
      }
      return null;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
