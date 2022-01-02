import 'dart:async';
import 'api.dart';
import 'package:journalapp/models/classes/user.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<User> registerUser(String username, String email, String password) =>
      apiProvider.registerUser(username, email, password);

  Future loginUser(String username, String password) =>
      apiProvider.loginUser(username, password);
}
