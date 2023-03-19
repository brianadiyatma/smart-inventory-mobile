// To parse this JSON data, do
//
//     final dataTransactionList = dataTransactionListFromJson(jsonString);

import 'dart:convert';

DataTransactionList dataTransactionListFromJson(String str) =>
    DataTransactionList.fromJson(json.decode(str));

String dataTransactionListToJson(DataTransactionList data) =>
    json.encode(data.toJson());

class DataTransactionList {
  DataTransactionList({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory DataTransactionList.fromJson(Map<String, dynamic> json) =>
      DataTransactionList(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Dokumen> data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Dokumen>.from(json["data"].map((x) => Dokumen.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Dokumen {
  Dokumen(
      {this.docNumber,
      this.docDate,
      this.status,
      this.pembuat,
      this.type,
      this.fiscalYear,
      this.countItem,
      this.createdAt,
      this.enterDate});

  String? docNumber;
  DateTime? docDate;
  String? status;
  String? pembuat;
  String? type;
  String? fiscalYear;
  String? enterDate;
  String? createdAt;
  int? countItem;

  factory Dokumen.fromJson(Map<String, dynamic> json) => Dokumen(
      docNumber: json["doc_number"],
      docDate: DateTime.parse(json["doc_date"]),
      status: json["status"],
      pembuat: json["pembuat"],
      type: json["type"],
      countItem: json["count_item"],
      fiscalYear: json["fiscal_year"],
      enterDate: json['enter_date'],
      createdAt: json['created_at']);

  Map<String, dynamic> toJson() => {
        "doc_number": docNumber,
        "doc_date": docDate?.toIso8601String(),
        "status": status,
        "pembuat": pembuat,
        "type": type,
        "count_item": countItem,
        "fiscal_year": fiscalYear,
        'enter_date': enterDate,
        'created_at': createdAt
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
