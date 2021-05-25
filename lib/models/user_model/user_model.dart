import 'dart:convert';

class UserModel {
  String name;
  String cpf;
  String email;
  int age;
  int priorityGroupCode;
  int vaccinationStatusCode;
  int covidVaccineCode;

  UserModel({
    required this.name,
    required this.cpf,
    required this.email,
    required this.age,
    required this.priorityGroupCode,
    required this.vaccinationStatusCode,
    required this.covidVaccineCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cpf': cpf,
      'email': email,
      'age': age,
      'priorityGroupCode': priorityGroupCode,
      'vaccinationStatusCode': vaccinationStatusCode,
      'covidVaccineCode': covidVaccineCode,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      cpf: map['cpf'],
      email: map['email'],
      age: map['age'],
      priorityGroupCode: map['priorityGroupCode'],
      vaccinationStatusCode: map['vaccinationStatusCode'],
      covidVaccineCode: map['covidVaccineCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
