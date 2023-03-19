// To parse this JSON data, do
//
//     final dataDashboard = dataDashboardFromJson(jsonString);

import 'dart:convert';

DataDashboard dataDashboardFromJson(String str) =>
    DataDashboard.fromJson(json.decode(str));

String dataDashboardToJson(DataDashboard data) => json.encode(data.toJson());

class DataDashboard {
  DataDashboard({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory DataDashboard.fromJson(Map<String, dynamic> json) => DataDashboard(
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
    this.header,
    this.transactionNot,
    this.transactionToday,
    this.material,
  });

  List<Header>? header;
  List<Transaction>? transactionNot;
  List<Transaction>? transactionToday;
  List<MaterialInfo>? material;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        header:
            List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        transactionNot: List<Transaction>.from(
            json["transactionNot"].map((x) => Transaction.fromJson(x))),
        transactionToday: List<Transaction>.from(
            json["transactionToday"].map((x) => Transaction.fromJson(x))),
        material: List<MaterialInfo>.from(
            json["material"].map((x) => MaterialInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": List<dynamic>.from(header!.map((x) => x.toJson())),
        "transactionNot":
            List<dynamic>.from(transactionNot!.map((x) => x.toJson())),
        "transactionToday":
            List<dynamic>.from(transactionToday!.map((x) => x.toJson())),
        "material": List<dynamic>.from(material!.map((x) => x.toJson())),
      };
}

class Header {
  Header({
    this.type,
    this.count,
  });

  String? type;
  int? count;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        type: json["type"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "count": count,
      };
}

class MaterialInfo {
  MaterialInfo(
      {this.id,
      this.materialCode,
      this.plantCode,
      this.storlocCode,
      this.binCode,
      this.storageTypeCode,
      this.specialStock,
      this.specialStockNumber,
      this.grDate,
      this.qty,
      this.createdAt,
      this.updatedAt,
      this.materialCodes,
      this.specification,
      this.uomName,
      this.uomId});

  int? id;
  String? materialCode;
  String? plantCode;
  String? storlocCode;
  String? binCode;
  String? storageTypeCode;
  String? specialStock;
  String? specialStockNumber;
  DateTime? grDate;
  String? qty;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? materialCodes;
  String? specification;
  String? uomId;
  String? uomName;

  factory MaterialInfo.fromJson(Map<String, dynamic> json) => MaterialInfo(
        id: json["id"],
        materialCode: json["material_code"],
        plantCode: json["plant_code"],
        storlocCode: json["storloc_code"],
        binCode: json["bin_code"],
        storageTypeCode: json["storage_type_code"],
        specialStock: json["special_stock"],
        specialStockNumber: json["special_stock_number"],
        grDate: DateTime.parse(json["gr_date"]),
        qty: json["qty"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        materialCodes: json["material_codes"],
        specification: json["specification"],
        uomName: json["uom_name"],
        uomId: json["uom_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "material_code": materialCode,
        "plant_code": plantCode,
        "storloc_code": storlocCode,
        "bin_code": binCode,
        "storage_type_code": storageTypeCode,
        "special_stock": specialStock,
        "special_stock_number": specialStockNumber,
        "gr_date": grDate?.toIso8601String(),
        "qty": qty,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "material_codes": materialCodes,
        "specification": specification,
        "uom_name": uomName,
        "uom_code": uomId,
      };
}

class Transaction {
  Transaction({
    this.docNumber,
    this.docDate,
    this.status,
    this.pembuat,
    this.type,
    this.fiscalYear,
    this.countItem,
    this.createdAt,
    this.updatedAt,
  });

  String? docNumber;
  DateTime? docDate;
  String? status;
  String? pembuat;
  String? fiscalYear;
  String? type;
  int? countItem;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        docNumber: json["doc_number"],
        docDate: DateTime.parse(json["doc_date"]),
        status: json["status"],
        pembuat: json["pembuat"],
        type: json["type"],
        fiscalYear: json["fiscal_year"],
        countItem: json["count_item"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "doc_number": docNumber,
        "doc_date":
            "${docDate?.year.toString().padLeft(4, '0')}-${docDate?.month.toString().padLeft(2, '0')}-${docDate?.day.toString().padLeft(2, '0')}",
        "status": status,
        "pembuat": pembuat,
        "type": type,
        "fiscal_year": fiscalYear,
        "count_item": countItem,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
