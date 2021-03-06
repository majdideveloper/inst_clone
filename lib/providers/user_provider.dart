import 'package:flutter/material.dart';
import 'package:instg_app/resources/auth_methods.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User? user = await AuthMethods().getUserDetails();
    _user = user;
    notifyListeners();
  }
}
