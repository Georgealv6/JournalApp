import 'package:flutter/rendering.dart';

class User {
  String? username;
  String? email;
  String? password;
  String? apikey;
  int? id;

  User(this.username, this.email, this.password, this.id, this.apikey);

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(parsedJson['username'], parsedJson['emailaddress'],
        parsedJson['password'], parsedJson['id'], parsedJson['apikey']);
  }
}
