import 'dart:convert';

class InformasiDetailBPM {
  String? status;
  Data? data;

  InformasiDetailBPM({this.status, this.data});

  InformasiDetailBPM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Detail? detail;
  List<Bin>? bin;

  Data({this.detail, this.bin});

  Data.fromJson(Map<String, dynamic> json) {
    detail =
        json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    if (json['bin'] != null) {
      bin = <Bin>[];
      json['bin'].forEach((v) {
        bin!.add(new Bin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    if (this.bin != null) {
      data['bin'] = this.bin!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  int? id;
  int? bpmId;
  String? reservationNumber;
  String? item;
  String? wbsCode;
  String? materialCode;
  String? plantCode;
  String? requirementDate;
  String? requirementQty;
  String? uomCode;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? specification;
  String? materialDesc;
  int? qtyOut;
  int? qtyLeft;
  Bpm? bpm;
  Wbs? wbs;

  Detail(
      {this.id,
      this.bpmId,
      this.reservationNumber,
      this.item,
      this.wbsCode,
      this.materialCode,
      this.plantCode,
      this.requirementDate,
      this.requirementQty,
      this.uomCode,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.specification,
      this.materialDesc,
      this.qtyOut,
      this.qtyLeft,
      this.bpm,
      this.wbs});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bpmId = json['bpm_id'];
    reservationNumber = json['reservation_number'];
    item = json['item'];
    wbsCode = json['wbs_code'];
    materialCode = json['material_code'];
    plantCode = json['plant_code'];
    requirementDate = json['requirement_date'];
    requirementQty = json['requirement_qty'];
    uomCode = json['uom_code'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    specification = json['specification'];
    materialDesc = json['material_desc'];
    qtyOut = json['qty_out'];
    qtyLeft = json['qty_left'];
    bpm = json['bpm'] != null ? new Bpm.fromJson(json['bpm']) : null;
    wbs = json['wbs'] != null ? new Wbs.fromJson(json['wbs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bpm_id'] = this.bpmId;
    data['reservation_number'] = this.reservationNumber;
    data['item'] = this.item;
    data['wbs_code'] = this.wbsCode;
    data['material_code'] = this.materialCode;
    data['plant_code'] = this.plantCode;
    data['requirement_date'] = this.requirementDate;
    data['requirement_qty'] = this.requirementQty;
    data['uom_code'] = this.uomCode;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['specification'] = this.specification;
    data['material_desc'] = this.materialDesc;
    data['qty_out'] = this.qtyOut;
    data['qty_left'] = this.qtyLeft;
    if (this.bpm != null) {
      data['bpm'] = this.bpm!.toJson();
    }
    if (this.wbs != null) {
      data['wbs'] = this.wbs!.toJson();
    }
    return data;
  }
}

class Bpm {
  int? id;
  String? pembuat;
  String? docNumber;
  String? docDate;
  String? status;
  String? fiscalYear;
  String? enterDate;
  String? startedAt;
  Null? finishedAt;
  String? createdAt;
  String? updatedAt;

  Bpm(
      {this.id,
      this.pembuat,
      this.docNumber,
      this.docDate,
      this.status,
      this.fiscalYear,
      this.enterDate,
      this.startedAt,
      this.finishedAt,
      this.createdAt,
      this.updatedAt});

  Bpm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembuat = json['pembuat'];
    docNumber = json['doc_number'];
    docDate = json['doc_date'];
    status = json['status'];
    fiscalYear = json['fiscal_year'];
    enterDate = json['enter_date'];
    startedAt = json['started_at'];
    finishedAt = json['finished_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pembuat'] = this.pembuat;
    data['doc_number'] = this.docNumber;
    data['doc_date'] = this.docDate;
    data['status'] = this.status;
    data['fiscal_year'] = this.fiscalYear;
    data['enter_date'] = this.enterDate;
    data['started_at'] = this.startedAt;
    data['finished_at'] = this.finishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Wbs {
  int? id;
  int? projectId;
  String? wbsCode;
  String? wbsDesc;
  String? createdAt;
  String? updatedAt;
  Project? project;

  Wbs(
      {this.id,
      this.projectId,
      this.wbsCode,
      this.wbsDesc,
      this.createdAt,
      this.updatedAt,
      this.project});

  Wbs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    wbsCode = json['wbs_code'];
    wbsDesc = json['wbs_desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['wbs_code'] = this.wbsCode;
    data['wbs_desc'] = this.wbsDesc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? projectCode;
  String? projectDesc;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  Project(
      {this.id,
      this.projectCode,
      this.projectDesc,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectCode = json['project_code'];
    projectDesc = json['project_desc'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_code'] = this.projectCode;
    data['project_desc'] = this.projectDesc;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Bin {
  int? id;
  String? storageBinCode;
  String? storageBinName;
  String? storageTypeId;
  int? storageLocationId;
  String? plantId;
  String? createdAt;
  String? updatedAt;
  String? qty;
  String? plantName;
  String? storageTypeName;
  String? storageLocationName;

  Bin(
      {this.id,
      this.storageBinCode,
      this.storageBinName,
      this.storageTypeId,
      this.storageLocationId,
      this.plantId,
      this.createdAt,
      this.updatedAt,
      this.qty,
      this.plantName,
      this.storageLocationName,
      this.storageTypeName});

  Bin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storageBinCode = json['storage_bin_code'];
    storageBinName = json['storage_bin_name'];
    storageTypeId = json['storage_type_id'];
    storageLocationId = json['storage_location_id'];
    plantId = json['plant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    qty = json['qty'];
    plantName = json['plant_name'];
    storageLocationName = json['storage_location_name'];
    storageTypeName = json['storage_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storage_bin_code'] = this.storageBinCode;
    data['storage_bin_name'] = this.storageBinName;
    data['storage_type_id'] = this.storageTypeId;
    data['storage_location_id'] = this.storageLocationId;
    data['plant_id'] = this.plantId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['qty'] = this.qty;
    data['plant_name'] = this.plantName;
    data['storage_location_name'] = this.storageLocationName;
    data['storage_type_name'] = this.storageTypeName;
    return data;
  }
}
