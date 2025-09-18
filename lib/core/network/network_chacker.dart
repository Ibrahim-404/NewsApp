import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
}

class NetworkCheckerImpl implements NetworkChecker {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkCheckerImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
