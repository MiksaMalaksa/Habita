import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habita/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/src/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:habita/src/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //*usecases
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final CurrentUser _currentUser;
  final AppUserCubit _userCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
    required AppUserCubit userCubit,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _currentUser = currentUser,
        _userCubit = userCubit,
        super(AuthInitial()) {
    on<AuthSignUp>(_signUpHandler);
    on<AuthSignIn>(_signInHandler);
    on<AuthUserLoggedIn>(_userLoggedHandler);
  }

  Future<void> _signUpHandler(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthProcessing());

    final result = await _userSignUp(UserSignUpParams(
        name: event.name, email: event.email, password: event.password));
    result.fold((fail) => emit(AuthError(errorMessage: fail.message)),
        (success) => _emitAuthSuccess(user: success, emit: emit));
  }

  Future<void> _signInHandler(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthProcessing());

    final result = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password));
    result.fold((fail) => emit(AuthError(errorMessage: fail.message)),
        (success) => _emitAuthSuccess(user: success, emit: emit));
  }


  Future<void> _userLoggedHandler(
    AuthUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthProcessing());

    final result = await _currentUser(NoParams());
    result.fold((fail) => emit(AuthInitial()),
        (success) => _emitAuthSuccess(user: success, emit: emit));
  }

  //*mutual
  void _emitAuthSuccess(
      {required User user, required Emitter<AuthState> emit}) {
    _userCubit.updateUser(user);
    emit(AuthLoaded(user: user));
  }
}
