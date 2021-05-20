import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacina_me/models/citizen_model/citizen_model.dart';
import 'package:vacina_me/models/database_model/database_model.dart';

class CitizenController {
  CitizenModel citizen = CitizenModel();
  BuildContext context;

  CitizenController({
    required this.context,
  });

  Future<String?> registerCitizen ({
    required String name,
    required String email,
    required String cpf,
    required int age,
    int priorityGroupCode = 0,
  }) async {
    citizen.name = name;
    citizen.email = email;
    citizen.cpf = cpf;
    citizen.age = age;
    citizen.priorityGroupCode = priorityGroupCode;
    return await Provider.of<DatabaseModel>(context, listen: false).insert(citizen);
  }

  
}
