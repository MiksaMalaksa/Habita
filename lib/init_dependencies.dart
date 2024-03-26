//!sl - serviceLocator
import 'package:get_it/get_it.dart';
import 'package:habita/core/supabase_keys/supa_keys.dart';
import 'package:habita/src/features/auth/data/data_sources/auth_datasource_impl.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:habita/src/features/auth/data/repositories/auth_remo_impl.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';
import 'package:habita/src/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/signup_usecase.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initialise() async {
  _initAuth();
  //!supabase
  final supabase = await Supabase.initialize(
      url: SupabaseKeys.supaUrl, anonKey: SupabaseKeys.supaAnonKey);
  sl.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  sl.registerFactory<IAuthDataSource>(() => AuthDatasourceImpl(client: sl()));
  sl.registerFactory<IAuthRepo>(() => AuthRepoImpl(datasource: sl()));
  //*usecases
  sl.registerFactory(() => UserSignUp(repository: sl()));
  sl.registerFactory(() => UserSignIn(repository: sl()));
  sl.registerFactory(() => CurrentUser(repository: sl()));
  //*Bloc
  sl.registerLazySingleton(
      () => AuthBloc(userSignUp: sl(), userSignIn: sl(), currentUser: sl()));
}
