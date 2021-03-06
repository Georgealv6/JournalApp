import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  AuthService() {
    print("new AuthService");
  }

  Future getUser() {
    return Future.value(currentUser);
  }

  // wrappinhg the firebase calls
  Future logout() {
    currentUser = null;
    notifyListeners();
    return Future.value(currentUser);
  }

  // wrapping the firebase calls
  Future createUser(
      {String? username, String? email, String? password}) async {}

  // logs in the user if password matches
  Future loginUser({String? username, String? password}) {
    if (password == 'password123') {
      currentUser = {'username': username};
      notifyListeners();
      return Future.value(currentUser);
    } else {
      currentUser = null;
      return Future.value(null);
    }
  }
}
