import 'package:vacina_me/models/user_model/user_model.dart';
import 'package:vacina_me/repositories/account_repository/account_repository.dart';
import 'package:vacina_me/viewmodel/vaccination_data_search_viewmodel/vaccination_data_search_viewmodel.dart';

class VaccinationDataSearchController {
  AccountRepository? repository;

  VaccinationDataSearchController() {
    repository = AccountRepository();
  }

  Future<UserModel?> search(VaccinationDataSearchViewModel model) async {
    var user = await repository!.readAccountData(model);
    return user;
  }
}
