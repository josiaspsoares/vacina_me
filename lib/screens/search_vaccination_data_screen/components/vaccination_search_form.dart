import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/screens/common_components/custom_button.dart';

class VaccinationSearchForm extends StatefulWidget {
  @override
  _VaccinationSearchFormState createState() => _VaccinationSearchFormState();
}

class _VaccinationSearchFormState extends State<VaccinationSearchForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              icon: Icon(Icons.email),
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
            style: AppTextStyles.vaccinationForm,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O preenchimento é obrigatório';
              }
              if (!value.contains('@') || !value.contains('.')) {
                return 'O email é inválido';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: _cpfController,
            decoration: InputDecoration(
              labelText: 'CPF',
              helperText: 'Informe apenas os números',
              counterText: "",
              icon: Icon(Icons.document_scanner),
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
            style: AppTextStyles.vaccinationForm,
            keyboardType: TextInputType.datetime,
            maxLength: 11,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O preenchimento é obrigatório';
              }
              if (value.length != 11) {
                return 'O CPF deve conter 11 dígitos';
              }
              if (int.tryParse(value) == null) {
                return 'O CPF deve conter apenas números';
              }
              return null;
            },
          ),
          SizedBox(height: 25),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //   CitizenController(context: context)
                //       .registerCitizen(

                //     email: _emailController.text,
                //     cpf: _cpfController.text,

                //   )
                //       .then((value) {
                //     if (value == 'success') {
                //       _formKey.currentState!.reset();
                //       AwesomeDialog(
                //           context: context,
                //           animType: AnimType.LEFTSLIDE,
                //           headerAnimationLoop: false,
                //           dialogType: DialogType.SUCCES,
                //           title: 'Sucesso',
                //           desc:
                //               'Cadastro realizado com sucesso! Você será comunicado quando chegar a hora de receber a vacina!',
                //           btnOkOnPress: () {
                //             Navigator.of(context).pushNamed('/');
                //           },
                //           btnOkIcon: Icons.check_circle,
                //           onDissmissCallback: () {
                //             debugPrint('Dialog Dissmiss from callback');
                //           })
                //         ..show();
                //     } else {
                //       AwesomeDialog(
                //           context: context,
                //           dialogType: DialogType.ERROR,
                //           animType: AnimType.RIGHSLIDE,
                //           headerAnimationLoop: false,
                //           title: 'Falha ao Realizar Cadastro',
                //           desc: value == '1062' ? 'Parece que você já realizou um cadastro anteriormente. Verifique o e-mail e o CPF informados!' : 'Ops! Houve um erro ao registrar suas informações. Por favor, entre em contato com nossa equipe (ERRO: $value)',
                //           btnOkOnPress: () {},
                //           btnOkIcon: Icons.cancel,
                //           btnOkColor: Colors.red)
                //         ..show();
                //     }
                //   });
              }
            },
            text: 'BUSCAR',
          ),
        ],
      ),
    );
  }
}
