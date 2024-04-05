
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


}
