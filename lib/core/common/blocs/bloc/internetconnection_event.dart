part of 'internetconnection_bloc.dart';

sealed class InternetConnectionEvent extends Equatable {
  const InternetConnectionEvent();

  @override
  List<Object> get props => [];
}

final class InternetPresent extends InternetConnectionEvent{}

final class InternetIsNotPresent extends InternetConnectionEvent{}