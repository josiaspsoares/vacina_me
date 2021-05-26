import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:vacina_me/controllers/signup_controller/signup_controller.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/screens/common_components/custom_button.dart';
import 'package:vacina_me/viewmodel/signup_viewmodel/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  var model = SignupViewModel();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  int _selectedPriorityGroupCode = 0;

  @override
  Widget build(BuildContext context) {
    final _controller = context.watch<SignupController>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nome',
              icon: Icon(Icons.person),
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
            style: AppTextStyles.vaccinationForm,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O preenchimento é obrigatório';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
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
          SizedBox(height: 15),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(
              labelText: 'Idade',
              helperText: 'Considere apenas anos completos',
              counterText: "",
              icon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
            style: AppTextStyles.vaccinationForm,
            keyboardType: TextInputType.datetime,
            maxLength: 3,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O preenchimento é obrigatório';
              }
              if (int.tryParse(value) == null) {
                return 'A idade deve conter somente números';
              }
              if (int.parse(value) < 18 || int.parse(value) > 140) {
                return 'A idade é inválida ou não é permitida';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          DropdownButtonFormField(
            value: _selectedPriorityGroupCode,
            decoration: InputDecoration(
              labelText: 'Grupo Prioritário',
              icon: Icon(Icons.priority_high),
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
            style: AppTextStyles.vaccinationForm,
            onChanged: (dynamic newValue) {
              setState(() {
                newValue != null
                    ? _selectedPriorityGroupCode = newValue
                    : _selectedPriorityGroupCode = _selectedPriorityGroupCode;
              });
            },
            items: dropdownMenuItems(),
          ),
          SizedBox(height: 25),
          if (_controller.state == SignupState.loading)
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: LinearProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          CustomButton(
            onPressed: _controller.state == SignupState.loading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      model.name = _nameController.text;
                      model.email = _emailController.text;
                      model.cpf = _cpfController.text;
                      model.age = _ageController.text;
                      model.priorityGroupCode =
                          _selectedPriorityGroupCode.toString();

                      _controller.create(model).then((value) {
                        if (value == 'success') {
                          _formKey.currentState!.reset();
                          AwesomeDialog(
                              context: context,
                              animType: AnimType.LEFTSLIDE,
                              headerAnimationLoop: false,
                              dialogType: DialogType.SUCCES,
                              title: 'Sucesso',
                              desc:
                                  'Cadastro realizado com sucesso! Você será comunicado quando chegar a hora de receber a vacina!',
                              btnOkOnPress: () {
                                Navigator.of(context).pushNamed('/');
                              },
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
                              title: 'Falha ao Realizar Cadastro',
                              desc: value == '1062'
                                  ? 'Parece que você já realizou um cadastro anteriormente. Verifique o e-mail e o CPF informados!'
                                  : 'Ops! Houve um erro ao registrar suas informações. Por favor, entre em contato com nossa equipe! (ERRO: $value)',
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
                            title: 'Falha ao Realizar Cadastro',
                            desc:
                                'Ops! Houve um erro ao registrar suas informações. Por favor, entre em contato com nossa equipe\n\nERRO: ${error.toString()}',
                            btnOkOnPress: () {},
                            btnOkIcon: Icons.cancel,
                            btnOkColor: Colors.red)
                          ..show();
                      });
                    }
                  },
            text: 'CADASTRAR',
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<dynamic>> dropdownMenuItems() {
    return <DropdownMenuItem>[
      DropdownMenuItem(
        child: Text(
          'Nenhum',
          style: AppTextStyles.vaccinationForm,
        ),
        value: 0,
      ),
      DropdownMenuItem(
        child: Text(
          'Comorbidades',
          style: AppTextStyles.vaccinationForm,
        ),
        value: 1,
      ),
    ];
  }
}
