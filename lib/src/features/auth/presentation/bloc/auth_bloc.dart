import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/src/features/auth/domain/entities/user.dart';
import 'package:habita/src/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/delete_account.dart';
import 'package:habita/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/signup_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/signout_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/update_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //*usecases
  final UserSignOut _userSignOut;
  final UpdateUser _updateUser;
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final CurrentUser _currentUser;
  final DeleteUserAccount _deleteUser;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
    required UserSignOut userSignOut,
    required UpdateUser updateUser,
    required DeleteUserAccount deleteUser,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _currentUser = currentUser,
        _userSignOut = userSignOut,
        _updateUser = updateUser,
        _deleteUser = deleteUser,
        super(const AuthGreet(null)) {
    on<AuthSignUp>(_signUpHandler);
    on<AuthSignIn>(_signInHandler);
    on<AuthSignOut>(_signOutHandler);
    on<AuthUpdateUser>(_updateHandler);
    on<AuthLoggedIn>(_userLoggedHandler);
    on<DeleteUserEvent>(_deleteUserHandler);
  }

  Future<void> _deleteUserHandler(
      DeleteUserEvent event, Emitter<AuthState> emit) async {
    final result = await _deleteUser(state.user!.email);
    result.fold(
        (fail) => emit(AuthError(state.user, errorMessage: fail.message)),
        (_) => _userState(user: null, emit: emit));
  }

  Future<void> _signUpHandler(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthProcessing(state.user));

    final result = await _userSignUp(UserSignUpParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));
    result
        .fold((fail) => emit(AuthError(state.user, errorMessage: fail.message)),
            (success) {
      _userState(user: success, emit: emit);
      emit(AuthLoaded(success));
    });
  }

  Future<void> _signInHandler(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthProcessing(state.user));

    final result = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password));
    result
        .fold((fail) => emit(AuthError(state.user, errorMessage: fail.message)),
            (success) {
      _userState(user: success, emit: emit);
      emit(AuthLoaded(success));
    });
  }

  Future<void> _signOutHandler(
      AuthSignOut event, Emitter<AuthState> emit) async {
    final result = await _userSignOut(NoParams());
    result.fold(
      (fail) => emit(AuthError(state.user, errorMessage: fail.message)),
      (_) {
        _userState(user: null, emit: emit);
      },
    );
  }

  Future<void> _updateHandler(
      AuthUpdateUser event, Emitter<AuthState> emit) async {
    final result = await _updateUser(UpdateUserParams(
      name: event.name,
      password: event.password,
      oldPassword: event.oldPassword,
      email: event.email,
      imagePath: event.imagePath,
      imageFile: event.imageFile
      
    ));

    result.fold(
      (fail) {
        emit(AuthError(state.user, errorMessage: fail.message));
        emit(AuthLoaded(state.user));
      },
      (user) {
        _userState(user: user, emit: emit);
        emit(AuthUpdated(user));
        emit(AuthLoaded(user));
      },
    );
  }

  //!is logged
  Future<void> _userLoggedHandler(
    AuthLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _currentUser(NoParams());
    result.fold((_) => emit(const AuthInitial(null)), (success) {
      _userState(user: success, emit: emit);
      emit(AuthLoaded(success));
    });
  }

  //*mutual
  void _userState({
    required SupaUser? user,
    required Emitter<AuthState> emit,
  }) {
    //!Check User
    if (user == null) {
      emit(const AuthInitial(null));
    } else {
      emit(AuthUserLogged(user));
    }
  }
}
