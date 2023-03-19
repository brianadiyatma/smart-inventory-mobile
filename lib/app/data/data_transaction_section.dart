// To parse this JSON data, do
//
//     final dataTransactionSection = dataTransactionSectionFromJson(jsonString);

import 'dart:convert';

DataTransactionSection dataTransactionSectionFromJson(String str) =>
    DataTransactionSection.fromJson(json.decode(str));

String dataTransactionSectionToJson(DataTransactionSection data) =>
    json.encode(data.toJson());

class DataTransactionSection {
  DataTransactionSection({
    this.status,
    this.data,
  });

  String? status;
  List<Dokumen>? data;

  factory DataTransactionSection.fromJson(Map<String, dynamic> json) =>
      DataTransactionSection(
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
    this.createdAt,
    this.updatedAt,
    this.countItem,
  });

  String? docNumber;
  DateTime? docDate;
  String? status;
  String? pembuat;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? countItem;

  factory Dokumen.fromJson(Map<String, dynamic> json) => Dokumen(
        docNumber: json["doc_number"],
        docDate: DateTime.parse(json["doc_date"]),
        status: json["status"],
        pembuat: json["pembuat"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        countItem: json["count_item"],
      );

  Map<String, dynamic> toJson() => {
        "doc_number": docNumber,
        "doc_date": docDate?.toIso8601String(),
        "status": status,
        "pembuat": pembuat,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "count_item": countItem,
      };
}
