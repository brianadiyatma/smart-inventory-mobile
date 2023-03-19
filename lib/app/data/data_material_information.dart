// To parse this JSON data, do
//
//     final dataMaterialInformation = dataMaterialInformationFromJson(jsonString);

import 'dart:convert';

DataMaterialInformation dataMaterialInformationFromJson(String str) =>
    DataMaterialInformation.fromJson(json.decode(str));

String dataMaterialInformationToJson(DataMaterialInformation data) =>
    json.encode(data.toJson());

class DataMaterialInformation {
  DataMaterialInformation({
    this.status,
    this.data,
  });

  String? status;
  List<Material>? data;

  factory DataMaterialInformation.fromJson(Map<String, dynamic> json) =>
      DataMaterialInformation(
        status: json["status"],
        data:
            List<Material>.from(json["data"].map((x) => Material.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Material {
  Material({
    this.id,
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
  });

  int? id;
  int? materialCode;
  int? plantCode;
  int? storlocCode;
  int? binCode;
  int? storageTypeCode;
  String? specialStock;
  String? specialStockNumber;
  DateTime? grDate;
  String? qty;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? materialCodes;

  factory Material.fromJson(Map<String, dynamic> json) => Material(
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
        "gr_date":
            "${grDate?.year.toString().padLeft(4, '0')}-${grDate?.month.toString().padLeft(2, '0')}-${grDate?.day.toString().padLeft(2, '0')}",
        "qty": qty,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "material_codes": materialCodes,
      };
}
