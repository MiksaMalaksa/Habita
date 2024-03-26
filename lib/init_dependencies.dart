//!sl - serviceLocator
import 'package:get_it/get_it.dart';
import 'package:habita/core/supabase_keys/supa_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initialise() async {
  final supabase = await Supabase.initialize(
      url: SupabaseKeys.supaUrl, anonKey: SupabaseKeys.supaAnonKey);
}
