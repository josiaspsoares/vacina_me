import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/models/expansion_panel_item_model/expansion_panel_item_model.dart';

class CommonQuestionsPanel extends StatefulWidget {
  final Color backgroundColor;
  final Color headerTextColor;

  const CommonQuestionsPanel({
    Key? key,
    this.backgroundColor = const Color(0xFFd3e5fd),
    this.headerTextColor = AppColors.textColor,
  }) : super(key: key);

  @override
  _CommonQuestionsPanelState createState() => _CommonQuestionsPanelState();
}

class _CommonQuestionsPanelState extends State<CommonQuestionsPanel> {
  @override
  Widget build(BuildContext context) {
    return _buildPanel();
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      dividerColor: Colors.white,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          commonQuestions[index].isExpanded = !isExpanded;
        });
      },
      children:
          commonQuestions.map<ExpansionPanel>((ExpansionPanelItemModel item) {
        return ExpansionPanel(
          backgroundColor: widget.backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: GoogleFonts.poppins(color: widget.headerTextColor),
              ),
            );
          },
          body: ListTile(
              title: SelectableText(
                item.expandedValue,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(color: Colors.black54),
              ),
              tileColor: Colors.white),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<ExpansionPanelItemModel> commonQuestions = <ExpansionPanelItemModel>[
  ExpansionPanelItemModel(
    headerValue: "Qual é a nossa missão?",
    expandedValue:
        "Existimos para promover a saúde a a vida, através de soluções tecnológicas que tornam mais eficientes a vacinação dos brasileiros.",
  ),
  ExpansionPanelItemModel(
    headerValue: "Qual é a nossa visão?",
    expandedValue:
        "Queremos contribuir para a universalização da vacinação em defesa da vida.",
  ),
  ExpansionPanelItemModel(
    headerValue: "Qual são os nossos valores?",
    expandedValue:
        "Respeito à saúde e à vida; Ética e transparência; Defesa da ciência; Promoção da diversidade; Difusão da informação e da tecnologia; Inovação; Colaboração; Sustentabilidade.",
  ),
  ExpansionPanelItemModel(
    headerValue: "Qual é o nosso produto?",
    expandedValue:
        "Nosso produto é o software VacinaMe, uma aplicação para controlar processos de vacinação e fazer gestão de pessoas vacinadas.",
  ),
  ExpansionPanelItemModel(
    headerValue: "O que nos levou a desenvolvê-lo?",
    expandedValue:
        "- Necessidade de controlar grandes processos de vacinação de forma eficiente em face da demanda provocada pela Covid-19.\n- Coleta, controle e tratamento de forma manual dos dados vacinais. Necessidade de digitalizar o processo.",
  ),
  ExpansionPanelItemModel(
    headerValue: "Qual foi a solução encontrada?",
    expandedValue:
        "Digitalização do processo de vacinação e do controle dos vacinados. O software que está sendo desenvolvido ajudará a reduzir custos e gastos desnecessários, e auxiliará no controle, na organização e na agilidade do processo.",
  ),
  ExpansionPanelItemModel(
    headerValue: "Quais são as vantagens?",
    expandedValue:
        "Melhor gestão da  vacinação, controle em relação às doses e à quantidade de pessoas vacinadas com  mais eficiência e de forma digital. Assim, haverá maior rapidez e redução de gastos desnecessários com um processo mais lento.",
  ),
  ExpansionPanelItemModel(
    headerValue: "Qual é o diferencial?",
    expandedValue:
        "Apresentação organizada dos dados vacinais, sendo possível saber quem tomou a primeira e a segunda dose, qual vacina recebeu e porque tomou. Tudo isso de forma especializada, organizada e controlada, tornando o processo de vacinação mais \"transparente\". ",
  ),
];
