import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vacina_me/controllers/vaccination_data_search_controller/vaccination_data_search_controller.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/screens/common_components/custom_button.dart';
import 'package:vacina_me/screens/vaccination_data_search_screen/components/vaccination_data_card.dart';
import 'package:vacina_me/viewmodel/vaccination_data_search_viewmodel/vaccination_data_search_viewmodel.dart';
import 'package:provider/provider.dart';

class VaccinationDataSearchForm extends StatefulWidget {
  @override
  _VaccinationDataSearchFormState createState() =>
      _VaccinationDataSearchFormState();
}

class _VaccinationDataSearchFormState extends State<VaccinationDataSearchForm> {
  final _formKey = GlobalKey<FormState>();
  var model = VaccinationDataSearchViewModel();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _controller = context.watch<VaccinationDataSearchController>();

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
            keyboardType: TextInputType.emailAddress,
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
            textInputAction: TextInputAction.done,
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
          if (_controller.state == VaccinationDataSearchState.loading)
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: LinearProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          CustomButton(
            onPressed: _controller.state == VaccinationDataSearchState.loading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      model.email = _emailController.text;
                      model.cpf = _cpfController.text;

                      _controller.search(model).then((value) {
                        if (value != null) {
                          AwesomeDialog(
                              context: context,
                              animType: AnimType.BOTTOMSLIDE,
                              headerAnimationLoop: false,
                              dialogType: DialogType.NO_HEADER,
                              dialogBackgroundColor:  Color(0xFF467CDE),
                              body: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                child: VaccinationDataCard(
                                  model: value,
                                ),
                              ),
                              btnOkOnPress: () {
                                Navigator.pop(context);
                              },
                              btnOkText: "PRONTO",
                              btnOkColor:  AppColors.accentColor,
                              btnOkIcon: Icons.check_circle,
                              onDissmissCallback: () {
                                debugPrint('Dialog Dissmiss from callback');
                              })
                            ..show();
                        } else {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.RIGHSLIDE,
                              headerAnimationLoop: false,
                              title: 'Falha ao Consultar Dados',
                              desc:
                                  'Ops! Não conseguimos buscar suas informações, verifique se os dados informados estão corretos. Caso o problema persista, entre em contato conosco!',
                              btnOkOnPress: () {},
                              btnOkIcon: Icons.cancel,
                              btnOkColor: Colors.red)
                            ..show();
                        }
                      }).onError((error, stackTrace) {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.RIGHSLIDE,
                            headerAnimationLoop: false,
                            title: 'Falha ao Consultar Dados',
                            desc:
                                'Ops! Houve uma falha ao buscar suas informações. Por favor, entre em contato com nossa equipe!\n\nERRO: ${error.toString()}',
                            btnOkOnPress: () {},
                            btnOkIcon: Icons.cancel,
                            btnOkColor: Colors.red)
                          ..show();
                      });
                    }
                  },
            text: 'CONSULTAR',
          ),
        ],
      ),
    );
  }
}
