import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internetconnection_event.dart';
part 'internetconnection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  InternetConnectionBloc() : super(const InternetConnectionIsPresent()) {
    on<InternetPresent>(
      (event, emit) => emit(const InternetConnectionIsPresent()),
    );
    on<InternetIsNotPresent>(
      (event, emit) => emit(const InternetConnectionIsNotPresent()),
    );

    Connectivity().onConnectivityChanged.listen((result) {
      if (result.first == ConnectivityResult.wifi ||
          result.first == ConnectivityResult.mobile) {
        add(InternetPresent());
      } else {
        add(InternetIsNotPresent());
      }
    }, onError: (_) => add(InternetIsNotPresent()));
  }
}
