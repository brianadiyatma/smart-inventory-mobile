class STTPInformasiDetail {
  String? status;
  Data? data;

  STTPInformasiDetail({this.status, this.data});

  STTPInformasiDetail.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? pembuat;
  String? docNumber;
  String? docDate;
  String? poNumber;
  String? projectCode;
  String? status;
  String? fiscalYear;
  String? startedAt;
  String? finishedAt;
  String? createdAt;
  String? updatedAt;
  String? type;
  bool? finish;
  int? countItem;
  List<Details>? details;

  Data(
      {this.id,
      this.pembuat,
      this.docNumber,
      this.docDate,
      this.poNumber,
      this.projectCode,
      this.status,
      this.fiscalYear,
      this.startedAt,
      this.finishedAt,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.countItem,
      this.details});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembuat = json['pembuat'];
    docNumber = json['doc_number'];
    docDate = json['doc_date'];
    poNumber = json['po_number'];
    projectCode = json['project_code'];
    status = json['status'];
    fiscalYear = json['fiscal_year'];
    startedAt = json['started_at'];
    finishedAt = json['finished_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    finish = json['finish'];
    countItem = json['count_item'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pembuat'] = this.pembuat;
    data['doc_number'] = this.docNumber;
    data['doc_date'] = this.docDate;
    data['po_number'] = this.poNumber;
    data['project_code'] = this.projectCode;
    data['status'] = this.status;
    data['fiscal_year'] = this.fiscalYear;
    data['started_at'] = this.startedAt;
    data['finished_at'] = this.finishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['finish'] = this.finish;
    data['count_item'] = this.countItem;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  int? sttpId;
  String? lineItem;
  String? wbsCode;
  String? materialCode;
  String? materialDesc;
  String? uom;
  String? qtyPo;
  String? qtyGr105;
  String? qtyNcr;
  String? qtyWarehouse;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? qtyInbound;

  Details(
      {this.id,
      this.sttpId,
      this.lineItem,
      this.wbsCode,
      this.materialCode,
      this.materialDesc,
      this.uom,
      this.qtyPo,
      this.qtyGr105,
      this.qtyNcr,
      this.qtyWarehouse,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.qtyInbound});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sttpId = json['sttp_id'];
    lineItem = json['line_item'];
    wbsCode = json['wbs_code'];
    materialCode = json['material_code'];
    materialDesc = json['material_desc'];
    uom = json['uom'];
    qtyPo = json['qty_po'];
    qtyGr105 = json['qty_gr_105'];
    qtyNcr = json['qty_ncr'];
    qtyWarehouse = json['qty_warehouse'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    qtyInbound = json['qty_inbound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sttp_id'] = this.sttpId;
    data['line_item'] = this.lineItem;
    data['wbs_code'] = this.wbsCode;
    data['material_code'] = this.materialCode;
    data['material_desc'] = this.materialDesc;
    data['uom'] = this.uom;
    data['qty_po'] = this.qtyPo;
    data['qty_gr_105'] = this.qtyGr105;
    data['qty_ncr'] = this.qtyNcr;
    data['qty_warehouse'] = this.qtyWarehouse;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['qty_inbound'] = this.qtyInbound;
    return data;
  }
}
