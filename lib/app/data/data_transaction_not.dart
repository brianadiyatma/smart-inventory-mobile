// To parse this JSON data, do
//
//     final dataTransactionNotProcess = dataTransactionNotProcessFromJson(jsonString);

import 'dart:convert';

DataTransactionNotProcess dataTransactionNotProcessFromJson(String str) =>
    DataTransactionNotProcess.fromJson(json.decode(str));

String dataTransactionNotProcessToJson(DataTransactionNotProcess data) =>
    json.encode(data.toJson());

class DataTransactionNotProcess {
  DataTransactionNotProcess({
    this.status,
    this.data,
  });

  String? status;
  List<Dokumen>? data;

  factory DataTransactionNotProcess.fromJson(Map<String, dynamic> json) =>
      DataTransactionNotProcess(
        status: json["status"],
        data: List<Dokumen>.from(json["data"].map((x) => Dokumen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Dokumen {
  Dokumen({
    this.docNumber,
    this.docDate,
    this.status,
    this.pembuat,
    this.type,
    this.countItem,
  });

  String? docNumber;
  DateTime? docDate;
  String? status;
  String? pembuat;
  String? type;
  int? countItem;

  factory Dokumen.fromJson(Map<String, dynamic> json) => Dokumen(
        docNumber: json["doc_number"],
        docDate: DateTime.parse(json["doc_date"]),
        status: json["status"],
        pembuat: json["pembuat"],
        type: json["type"],
        countItem: json["count_item"],
      );

  Map<String, dynamic> toJson() => {
        "doc_number": docNumber,
        "doc_date": docDate?.toIso8601String(),
        "status": status,
        "pembuat": pembuat,
        "type": type,
        "count_item": countItem,
      };
}
