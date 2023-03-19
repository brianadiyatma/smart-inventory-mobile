// To parse this JSON data, do
//
//     final dataHeaderDashboard = dataHeaderDashboardFromJson(jsonString);

import 'dart:convert';

DataHeaderDashboard dataHeaderDashboardFromJson(String str) =>
    DataHeaderDashboard.fromJson(json.decode(str));

String dataHeaderDashboardToJson(DataHeaderDashboard data) =>
    json.encode(data.toJson());

class DataHeaderDashboard {
  DataHeaderDashboard({
    this.status,
    this.data,
  });

  String? status;
  List<Dokumen>? data;

  factory DataHeaderDashboard.fromJson(Map<String, dynamic> json) =>
      DataHeaderDashboard(
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
    this.type,
    this.count,
  });

  String? type;
  int? count;

  factory Dokumen.fromJson(Map<String, dynamic> json) => Dokumen(
        type: json["type"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "count": count,
      };
}
