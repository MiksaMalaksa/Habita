import 'dart:io';

import 'package:habita/core/constants/exceptions_messages.dart';
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
        throw ServerException(message: serverFailMsg);
      }

      return UserModel.fromMap(response.user!.toJson()).copyWith(
          email: currentUserSession!.user.email,
          name: currentUserSession!.user.userMetadata!['name']);
    } on ServerException {
      rethrow;
    } catch (_) {
      throw ServerException(message: serverFailMsg);
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
        throw ServerException(message: serverFailMsg);
      }

      return UserModel.fromMap(response.user!.toJson())
        ..copyWith(email: currentUserSession!.user.email);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: serverFailMsg);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (_) {
      throw ServerException(message: serverFailMsg);
    }
  }

  @override
  Future<void> deleteAccount({required String email}) async {
    try {
      await client.rpc(
        'delete_user_by_email',
        params: {'delete_email': email},
      );
    } catch (e) {
      throw ServerException(message: serverFailMsg);
    }
  }

  @override
  Future<UserModel> updateUser({
    String? name,
    String? email,
    String? password,
    String? oldPassword,
    String? imagePath,
    File? imageFile,
  }) async {
    try {
      bool passwordCheck = true;
      UserResponse response;
      final currentUser = currentUserSession!.user;
      String? currentAvatarPath;

      if (imageFile != null && imagePath != null) {
        final imageBytes = await imageFile.readAsBytes();
        await client.storage.from('profiles').uploadBinary(
              imagePath,
              imageBytes,
            );
        await client.from('profiles').update({'avatar_url': imagePath}).eq(
            'id', currentUserSession!.user.id);
      }
      final mappedPath = await client
          .from('profiles')
          .select('avatar_url')
          .eq('id', currentUserSession!.user.id)
          .single();
      currentAvatarPath = mappedPath['avatar_url'] as String;
      //*Check password
      //*On success renew password
      if (password != null) {
        passwordCheck = await client.rpc(
          'check_password',
          params: {
            'password': oldPassword,
          },
        );
        if (!passwordCheck) {
          throw ServerException(message: oldPasswordIncorrectMsg);
        }

        response = await client.auth.updateUser(
          UserAttributes(
            email: email ?? currentUser.email,
            password: password,
            data: {
              'name': name ?? currentUser.userMetadata!['name'],
              'image_path':
                  imagePath ?? currentUser.userMetadata!['image_path'],
            },
          ),
        );
      }
      //*No password change required
      else {
        response = await client.auth.updateUser(UserAttributes(
            email: email ?? currentUser.email,
            data: {'name': name ?? currentUser.userMetadata!['name']}));
      }

      if (response.user == null) {
        throw ServerException(message: serverFailMsg);
      }

      final UserModel user = UserModel.fromMap(response.user!.toJson())
          .copyWith(
              name: response.user!.userMetadata!['name'],
              imagePath: currentAvatarPath);
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
        throw ServerException(message: serverFailMsg);
      }

      final UserModel user = UserModel.fromMap(response.toJson())
          .copyWith(name: response.userMetadata!['name']);
      return user;
    } catch (_) {
      throw ServerException(message: serverFailMsg);
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      //*can select specified fields by enumerating them: 'name', 'id', select by
      //*default select all(get all data)
      //*eq specifies a user we want
      //*session - primary unique identifier
      //!If the user is plugged in, current session would not be null
      if (currentUserSession != null) {
        final result = currentUserSession!.user.toJson();
        return UserModel.fromMap(result).copyWith(
          email: currentUserSession!.user.email,
          name: currentUserSession!.user.userMetadata!['name'],
        );
      }
      return null;
    } catch (_) {
      throw ServerException(message: serverFailMsg);
    }
  }
}
