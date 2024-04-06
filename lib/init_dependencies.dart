//!sl - serviceLocator
import 'package:get_it/get_it.dart';
import 'package:habita/core/common/blocs/bloc/internetconnection_bloc.dart';
import 'package:habita/core/network/connection_checker.dart';
import 'package:habita/core/supabase_keys/supa_keys.dart';
import 'package:habita/src/features/auth/data/data_sources/auth_datasource_impl.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:habita/src/features/auth/data/repositories/auth_remo_impl.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';
import 'package:habita/src/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/signup_usecase.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/settings/data/datasources/isettings_datasource.dart';
import 'package:habita/src/features/settings/data/datasources/settings_datasource_impl.dart';
import 'package:habita/src/features/settings/data/repo/settings_repo_impl.dart';
import 'package:habita/src/features/settings/domain/repo/isettings_repo.dart';
import 'package:habita/src/features/auth/domain/usecases/signout_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/update_user_usecase.dart';
import 'package:habita/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initialise() async {
  //!supabase
  final supabase = await Supabase.initialize(
      url: SupabaseKeys.supaUrl, anonKey: SupabaseKeys.supaAnonKey);
  sl.registerSingleton<SupabaseClient>(supabase.client);

  sl.registerFactory(
    () => InternetConnectionChecker(),
  );

  sl.registerFactory<IConnectionChecker>(
    () => ConnectionCheckerImpl(internetChecker: sl()),
  );

  //!Features
  _initAuth();
  _initInternetStreamChecker();
  _initSettings();
}

void _initAuth() {
  sl.registerSingleton<IAuthDataSource>(AuthDatasourceImpl(client: sl()));
  sl.registerSingleton<IAuthRepo>(
    AuthRepoImpl(
      datasource: sl(),
      connectionChecker: sl(),
    ),
  );
  //*usecases
  sl.registerSingleton<UserSignUp>(UserSignUp(repository: sl()));
  sl.registerSingleton<UserSignIn>(UserSignIn(repository: sl()));
  sl.registerSingleton<CurrentUser>(CurrentUser(repository: sl()));
  sl.registerSingleton<UserSignOut>(UserSignOut(repository: sl()));
  sl.registerSingleton<UpdateUser>(UpdateUser(repository: sl()));
  //*Bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      userSignUp: sl(),
      userSignIn: sl(),
      currentUser: sl(),
      updateUser: sl(),
      userSignOut: sl(),
    ),
  );
}

void _initInternetStreamChecker() {
  sl.registerFactory<InternetConnectionBloc>(() => InternetConnectionBloc());
}

void _initSettings() {
  sl.registerFactory<ISettingsDataSource>(
      () => SettingsDataSourceImpl(client: sl()));
  sl.registerFactory<ISettingsRepo>(
      () => SettingsRepoImpl(datasource: sl(), connectionChecker: sl()));

  //*Bloc
  sl.registerFactory<SettingsBloc>(() => SettingsBloc());
}
