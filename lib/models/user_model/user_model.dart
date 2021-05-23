class UserModel {
  String? name;
  String? cpf;
  String? email;
  int? age;
  int? priorityGroupCode;
  int? vaccinationStatusCode;
  int? covidVaccineCode;

  UserModel({
    required this.name,
    required this.cpf,
    required this.email,
    required this.age,
    required this.priorityGroupCode,
    required this.vaccinationStatusCode,
    required this.covidVaccineCode,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    email = json['email'];
    age = json['age'];
    priorityGroupCode = json['priorityGroupCode'];
    vaccinationStatusCode = json['vaccinationStatusCode'];
    covidVaccineCode = json['covidVaccineCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['email'] = this.email;
    data['age'] = this.age;
    data['priorityGroupCode'] = this.priorityGroupCode;
    data['vaccinationStatusCode'] = this.vaccinationStatusCode;
    data['covidVaccineCode'] = this.covidVaccineCode;
    return data;
  }
}
