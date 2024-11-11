import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Connection {
  final InternetConnection _connection;

  Connection({required InternetConnection connection})
      : _connection = connection;
  Future<bool> hasConnection() async => _connection.hasInternetAccess;
}
