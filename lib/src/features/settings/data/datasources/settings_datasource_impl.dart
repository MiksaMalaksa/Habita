import 'package:habita/src/features/settings/data/datasources/isettings_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsDataSourceImpl implements ISettingsDataSource {
  final SupabaseClient client;
  const SettingsDataSourceImpl({required this.client});

  @override
  Future<void> signOut() async {
    await client.auth.signOut();
  }
}
