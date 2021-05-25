import 'dart:convert';

class ExpansionPanelItemModel {
  String headerValue;
  String expandedValue;
  bool isExpanded;

  ExpansionPanelItemModel({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'headerValue': headerValue,
      'expandedValue': expandedValue,
      'isExpanded': isExpanded,
    };
  }

  factory ExpansionPanelItemModel.fromMap(Map<String, dynamic> map) {
    return ExpansionPanelItemModel(
      headerValue: map['headerValue'],
      expandedValue: map['expandedValue'],
      isExpanded: map['isExpanded'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpansionPanelItemModel.fromJson(String source) => ExpansionPanelItemModel.fromMap(json.decode(source));
}
