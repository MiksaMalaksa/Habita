//!sl - serviceLocator
import 'package:get_it/get_it.dart';
import 'package:habita/core/common/blocs/bloc/internetconnection_bloc.dart';
import 'package:habita/core/supabase_keys/supa_keys.dart';
import 'package:habita/src/features/auth/data/data_sources/auth_datasource_impl.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:habita/src/features/auth/data/repositories/auth_remo_impl.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';
import 'package:habita/src/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/delete_account.dart';
import 'package:habita/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/signup_usecase.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/habits/config/box_config.dart';
import 'package:habita/src/features/habits/data/datasources/local/habit_local_datasource_impl.dart';
import 'package:habita/src/features/habits/data/datasources/local/ihabit_local_datasource.dart';
import 'package:habita/src/features/habits/data/datasources/remote/habit_remote_datasource.dart';
import 'package:habita/src/features/habits/data/datasources/remote/ihabit_remote_datasource.dart';
import 'package:habita/src/features/habits/data/repositories/habit_repo_impl.dart';
import 'package:habita/src/features/habits/data/repositories/remote_habit_repo_impl.dart';
import 'package:habita/src/features/habits/domain/repositories/habit_repo.dart';
import 'package:habita/src/features/habits/domain/repositories/remote_repo.dart';
import 'package:habita/src/features/habits/domain/usecases/local_usecases/delete_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/local_usecases/edit_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/local_usecases/get_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/delete_habit_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/delete_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/edit_habit_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/edit_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/get_program_usecase.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/settings/data/datasources/isettings_datasource.dart';
import 'package:habita/src/features/settings/data/datasources/settings_datasource_impl.dart';
import 'package:habita/src/features/settings/data/repo/settings_repo_impl.dart';
import 'package:habita/src/features/settings/domain/repo/isettings_repo.dart';
import 'package:habita/src/features/auth/domain/usecases/signout_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/update_user_usecase.dart';
import 'package:habita/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:habita/src/features/settings/utils/shared_pref_utils.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initialise() async {
  //!supabase
  final supabase = await Supabase.initialize(
      url: SupabaseKeys.supaUrl, anonKey: SupabaseKeys.supaAnonKey);
  sl.registerSingleton<SupabaseClient>(supabase.client);

  //!Hive init
  await Hive.initFlutter();
  final programBox = await Hive.openBox(habitBox);
  sl.registerSingleton<Box>(programBox, instanceName: 'habit_program');

  //!core
  _initInternetStreamChecker();
  sl.registerFactory<ThemeBloc>(() => ThemeBloc());

  //!Features
  _initAuth();
  _initSettings();
  _initHabits();
}

void _initAuth() {
  sl.registerSingleton<IAuthDataSource>(AuthDatasourceImpl(client: sl()));
  sl.registerSingleton<IAuthRepo>(
    AuthRepoImpl(
      datasource: sl(),
    ),
  );
  //*usecases
  sl.registerSingleton<UserSignUp>(UserSignUp(repository: sl()));
  sl.registerSingleton<UserSignIn>(UserSignIn(repository: sl()));
  sl.registerSingleton<CurrentUser>(CurrentUser(repository: sl()));
  sl.registerSingleton<UserSignOut>(UserSignOut(repository: sl()));
  sl.registerSingleton<UpdateUser>(UpdateUser(repository: sl()));
  sl.registerSingleton<DeleteUserAccount>(DeleteUserAccount(repository: sl()));
  //*Bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      userSignUp: sl(),
      deleteUser: sl(),
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
  sl.registerSingleton(SharedPreferencesUtils());
  sl.registerFactory<ISettingsDataSource>(
      () => SettingsDataSourceImpl(client: sl()));
  sl.registerFactory<ISettingsRepo>(() => SettingsRepoImpl(datasource: sl()));

  //*Bloc
  sl.registerFactory<SettingsBloc>(() => SettingsBloc());
}

void _initHabits() {
  sl.registerSingleton<IHabitDataSource>(HabitDataSourceImpl(
    box: sl.get<Box>(instanceName: 'habit_program'),
  ));
  sl.registerSingleton<IRemoteHabitDataSource>(
    HabitRemoteDataSourceImpl(client: sl()),
  );

  sl.registerSingleton<IHabitRepo>(HabitRepoImpl(habitDataSource: sl()));
  sl.registerSingleton<IRemoteHabitRepo>(RemoteHabitRepoImpl(dataSource: sl()));

  //*hive Usecases
  sl.registerSingleton<DeleteProgram>(DeleteProgram(repository: sl()));
  sl.registerSingleton<EditProgram>(EditProgram(repository: sl()));
  sl.registerSingleton<GetProgram>(GetProgram(repository: sl()));

  //*supa Usecases
  sl.registerSingleton<DeleteProgramRemote>(
      DeleteProgramRemote(repository: sl()));
  sl.registerSingleton<EditProgramRemote>(EditProgramRemote(repository: sl()));
  sl.registerSingleton<GetProgramRemote>(GetProgramRemote(repository: sl()));
  sl.registerSingleton<DeleteHabitRemote>(DeleteHabitRemote(repository: sl()));
  sl.registerSingleton<EditHabitRemote>(EditHabitRemote(repository: sl()));

  sl.registerFactory<HabitBloc>(() => HabitBloc(
        deleteProgram: sl(),
        editProgram: sl(),
        getProgram: sl(),
        deleteHabitRemote: sl(),
        deleteProgramRemote: sl(),
        editHabitRemote: sl(),
        editProgramRemote: sl(),
        getProgramRemote: sl(),
      ));
}
