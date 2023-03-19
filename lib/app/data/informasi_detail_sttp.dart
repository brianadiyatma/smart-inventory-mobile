class InformasiDetailSTTP {
  String? status;
  Data? data;

  InformasiDetailSTTP({this.status, this.data});

  InformasiDetailSTTP.fromJson(Map<String, dynamic> json) {
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
  String? specification;
  int? qtyIn;
  int? qtyLeft;
  Sttp? sttp;

  Data(
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
      this.qtyIn,
      this.specification,
      this.qtyLeft,
      this.sttp});

  Data.fromJson(Map<String, dynamic> json) {
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
    qtyIn = json['qty_in'];
    qtyLeft = json['qty_left'];
    specification = json['specification'];
    sttp = json['sttp'] != null ? new Sttp.fromJson(json['sttp']) : null;
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
    data['qty_in'] = this.qtyIn;
    data['qty_left'] = this.qtyLeft;
    if (this.sttp != null) {
      data['sttp'] = this.sttp!.toJson();
    }
    return data;
  }
}

class Sttp {
  int? id;
  String? pembuat;
  String? docNumber;
  String? docDate;
  String? poNumber;
  String? projectCode;
  String? status;
  String? fiscalYear;
  String? enterAt;
  String? startedAt;
  String? finishedAt;
  String? createdAt;
  String? updatedAt;

  Sttp(
      {this.id,
      this.pembuat,
      this.docNumber,
      this.docDate,
      this.poNumber,
      this.projectCode,
      this.status,
      this.fiscalYear,
      this.enterAt,
      this.startedAt,
      this.finishedAt,
      this.createdAt,
      this.updatedAt});

  Sttp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembuat = json['pembuat'];
    docNumber = json['doc_number'];
    docDate = json['doc_date'];
    poNumber = json['po_number'];
    projectCode = json['project_code'];
    status = json['status'];
    fiscalYear = json['fiscal_year'];
    enterAt = json['enter_at'];
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
    data['po_number'] = this.poNumber;
    data['project_code'] = this.projectCode;
    data['status'] = this.status;
    data['fiscal_year'] = this.fiscalYear;
    data['enter_at'] = this.enterAt;
    data['started_at'] = this.startedAt;
    data['finished_at'] = this.finishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
