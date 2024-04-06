part of 'internetconnection_bloc.dart';

sealed class InternetConnectionState extends Equatable {
  final bool isConnected;
  const InternetConnectionState(this.isConnected);

  @override
  List<Object> get props => [];
}

final class InternetConnectionIsPresent extends InternetConnectionState {
  const InternetConnectionIsPresent() : super(true);
}

final class InternetConnectionIsNotPresent extends InternetConnectionState {
  const InternetConnectionIsNotPresent() : super(false);
}
