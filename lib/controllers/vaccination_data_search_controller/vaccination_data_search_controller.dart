import 'package:flutter/foundation.dart';
import 'package:vacina_me/models/user_model/user_model.dart';
import 'package:vacina_me/repositories/account_repository/account_repository.dart';
import 'package:vacina_me/viewmodel/vaccination_data_search_viewmodel/vaccination_data_search_viewmodel.dart';

enum VaccinationDataSearchState { idle, success, error, loading }
class VaccinationDataSearchController extends ChangeNotifier{
  AccountRepository? repository;
  var state = VaccinationDataSearchState.idle;

  VaccinationDataSearchController() {
    repository = AccountRepository();
  }

  Future<UserModel?> search(VaccinationDataSearchViewModel model) async {
    state =  VaccinationDataSearchState.loading;
    notifyListeners();

    try {
      var user = await repository!.readAccountData(model);
      state = VaccinationDataSearchState.success;
      notifyListeners();
      return user;
    } catch (e) {
      state = VaccinationDataSearchState.error;
      notifyListeners();
      throw e;
    }

    
  }
}
