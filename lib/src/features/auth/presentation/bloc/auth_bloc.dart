import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habita/src/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //*usecases
  final UserSignUp _userSignUp;

  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>(_signUpHandler);
  }

  Future<void> _signUpHandler(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthProcessing());

    final result = await _userSignUp(UserSignUpParams(
        name: event.name, email: event.email, password: event.password));
    result.fold((fail) => emit(AuthError(errorMessage: fail.message)), (success) => emit(AuthLoaded(uid: success)));
  }
}
