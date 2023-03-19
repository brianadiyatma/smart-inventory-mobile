class BPMInformasiDetail {
  String? status;
  Data? data;

  BPMInformasiDetail({this.status, this.data});

  BPMInformasiDetail.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? fiscalYear;
  String? startedAt;
  String? finishedAt;
  String? createdAt;
  String? updatedAt;
  String? destination;
  String? type;
  int? countItem;
  List<Details>? details;
  bool? finish;

  Data(
      {this.id,
      this.pembuat,
      this.docNumber,
      this.destination,
      this.docDate,
      this.status,
      this.fiscalYear,
      this.startedAt,
      this.finishedAt,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.countItem,
      this.finish,
      this.details});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembuat = json['pembuat'];
    docNumber = json['doc_number'];
    docDate = json['doc_date'];
    status = json['status'];
    fiscalYear = json['fiscal_year'];
    destination = json['destination'];
    startedAt = json['started_at'];
    finishedAt = json['finished_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    countItem = json['count_item'];
    finish = json['finish'];
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
    data['status'] = this.status;
    data['fiscal_year'] = this.fiscalYear;
    data['started_at'] = this.startedAt;
    data['finished_at'] = this.finishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['count_item'] = this.countItem;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  int? bpmId;
  String? reservationNumber;
  String? lineItem;
  String? wbsCode;
  String? materialCode;
  String? materialDesc;
  String? orderDate;
  String? orderQty;
  String? uom;
  String? note;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? qtyOutbound;

  Details(
      {this.id,
      this.bpmId,
      this.reservationNumber,
      this.lineItem,
      this.wbsCode,
      this.materialCode,
      this.materialDesc,
      this.orderDate,
      this.orderQty,
      this.uom,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.qtyOutbound});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bpmId = json['bpm_id'];
    reservationNumber = json['reservation_number'];
    lineItem = json['line_item'];
    wbsCode = json['wbs_code'];
    materialCode = json['material_code'];
    materialDesc = json['material_desc'];
    orderDate = json['requirement_date'];
    orderQty = json['requirement_qty'];
    uom = json['uom'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    qtyOutbound = json['qty_outbound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bpm_id'] = this.bpmId;
    data['reservation_number'] = this.reservationNumber;
    data['line_item'] = this.lineItem;
    data['wbs_code'] = this.wbsCode;
    data['material_code'] = this.materialCode;
    data['material_desc'] = this.materialDesc;
    data['order_date'] = this.orderDate;
    data['order_qty'] = this.orderQty;
    data['uom'] = this.uom;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['qty_outbound'] = this.qtyOutbound;
    return data;
  }
}
