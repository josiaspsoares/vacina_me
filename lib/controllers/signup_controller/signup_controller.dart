import 'package:flutter/material.dart';
import '../../repositories/account_repository/account_repository.dart';
import '../../viewmodel/signup_viewmodel/signup_viewmodel.dart';

class SignupController extends ChangeNotifier {
  AccountRepository? repository;
  SignupController() {
    repository = AccountRepository();
  }

  Future<String?> create(SignupViewModel model) async {
    var message = await repository!.createAccount(model);
    return message;
  }
}
