import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/src/features/auth/domain/entities/user.dart';
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

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _currentUser = currentUser,
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
        (success) => emit(AuthLoaded(user: success)));
  }

  Future<void> _signInHandler(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthProcessing());

    final result = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password));
    result.fold((fail) => emit(AuthError(errorMessage: fail.message)),
        (success) => emit(AuthLoaded(user: success)));
  }

  Future<void> _userLoggedHandler(
    AuthUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _currentUser(NoParams());
    result.fold((fail) => emit(AuthInitial()),
        (success) => emit(AuthLoaded(user: success)));
  }
}
