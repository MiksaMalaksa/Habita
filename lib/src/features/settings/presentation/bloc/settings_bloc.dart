import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habita/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/core/constants/miksa_url.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/src/features/settings/domain/usecases/get_user_usecase.dart';
import 'package:habita/src/features/settings/domain/usecases/signout_usecase.dart';
import 'package:habita/src/features/settings/domain/usecases/update_user_usecase.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UserSignOut _userSignOut;
  final UpdateUser _updateUser;
  final GetCurrentUser _getUser;
  final AppUserCubit _userCubit;

  SettingsBloc({
    required UserSignOut userSignOut,
    required AppUserCubit userCubit,
    required UpdateUser updateUser,
    required GetCurrentUser getUser,
  })  : _userSignOut = userSignOut,
        _userCubit = userCubit,
        _updateUser = updateUser,
        _getUser = getUser,
        super(SettingsInitial()) {
    on<SettingsGoTelegram>(_goToTelegram);
    on<SettingsGoGitHub>(_goToGitHub);
    on<SettingsUserSignOut>(_signOutHandler);
    on<SettingsUpdateUser>(_updateHandler);
    on<SettingsGetUser>(_getUserHandler);
  }

  //*Account
  Future<void> _signOutHandler(
      SettingsUserSignOut event, Emitter<SettingsState> emit) async {
    final result = await _userSignOut(NoParams());
    result.fold(
      (fail) => emit(SettingsError(errorMessage: fail.message)),
      (_) {
        _userCubit.updateUser(null);
      },
    );
  }

  Future<void> _updateHandler(
      SettingsUpdateUser event, Emitter<SettingsState> emit) async {
    final result = await _updateUser(UpdateUserParams(
      name: event.name,
      password: event.password,
      email: event.email,
    ));

    result.fold(
      (fail) {
        emit(SettingsError(errorMessage: fail.message));
        emit(SettingsLoaded(user: event.currentUser));
      },
      (user) {
        _userCubit.updateUser(user);
        emit(SettingsLoaded(user: user, success: true));
      },
    );
  }

  Future<void> _getUserHandler(
      SettingsGetUser event, Emitter<SettingsState> emit) async {
    final result = await _getUser(NoParams());
    result.fold(
      (fail) => emit(SettingsError(errorMessage: fail.message)),
      (user) => emit(SettingsLoaded(user: user)),
    );
  }

  //*Launch links
  Future<void> _goToTelegram(
      SettingsGoTelegram event, Emitter<SettingsState> emit) async {
    await _goTo(event, emit, miksaUrl);
  }

  Future<void> _goToGitHub(
      SettingsGoGitHub event, Emitter<SettingsState> emit) async {
    await _goTo(event, emit, miksaGitUrl);
  }

  Future<void> _goTo(
      SettingsEvent event, Emitter<SettingsState> emit, String path) async {
    final toGoUri = Uri.parse(path);
    if (!await launchUrl(toGoUri)) {
      emit(SettingsError(errorMessage: 'Could not launch $toGoUri'));
    }
    emit(SettingsInitial());
  }
}
