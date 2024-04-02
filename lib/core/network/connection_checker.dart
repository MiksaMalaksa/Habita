import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract interface class IConnectionChecker {
  Future<bool> get isConnected;
}

class ConnectionCheckerImpl implements IConnectionChecker {
  final InternetConnectionChecker internetChecker;

  const ConnectionCheckerImpl({required this.internetChecker});

  @override
  Future<bool> get isConnected async => await internetChecker.hasConnection;
}
