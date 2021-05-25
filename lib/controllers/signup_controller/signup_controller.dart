import 'package:flutter/material.dart';
import '../../repositories/account_repository/account_repository.dart';
import '../../viewmodel/signup_viewmodel/signup_viewmodel.dart';

enum SignupState { idle, success, error, loading }

class SignupController extends ChangeNotifier {
  AccountRepository? repository;
  var state = SignupState.idle;

  SignupController() {
    repository = AccountRepository();
  }

  Future<String?> create(SignupViewModel model) async {
    state = SignupState.loading;
    notifyListeners();

    try {
      var message = await repository!.createAccount(model);
      state = SignupState.success;
      notifyListeners();
      return message;
    } catch (e) {
      state = SignupState.error;
      notifyListeners();
      throw e;
    }
  }
}
