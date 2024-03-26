import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDatasourceImpl implements IAuthDataSource {
  final SupabaseClient client;
  const AuthDatasourceImpl({required this.client});

  @override
  Future<void> login({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUp({
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
      
      return response.user!.id;
    } on ServerException {
      rethrow;
    } catch (_) {
      throw ServerException(message: 'Server exception');
    }
  }
}
