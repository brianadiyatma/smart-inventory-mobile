class MaterialLoc {
  int? currentPage;
  List<Content>? content;
  int? lastPage;

  MaterialLoc({this.currentPage, this.content, this.lastPage});

  MaterialLoc.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      content = <Content>[];
      json['data'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.content != null) {
      data['data'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['last_page'] = this.lastPage;
    return data;
  }
}

class Content {
  int? id;
  String? materialCode;
  String? materialDesc;
  String? specification;
  int? uomId;
  int? materialGroupId;
  int? materialTypeId;
  String? createdAt;
  String? updatedAt;
  String? uomCode;
  String? plantName;
  String? storageTypeName;
  String? storageLocationName;
  int? qtyStock;
  String? storageBinName;

  Content(
      {this.id,
      this.materialCode,
      this.materialDesc,
      this.specification,
      this.uomId,
      this.materialGroupId,
      this.materialTypeId,
      this.createdAt,
      this.updatedAt,
      this.uomCode,
      this.plantName,
      this.storageTypeName,
      this.storageLocationName,
      this.storageBinName,
      this.qtyStock});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialCode = json['material_code'];
    materialDesc = json['material_desc'];
    specification = json['specification'];
    uomId = json['uom_id'];
    materialGroupId = json['material_group_id'];
    materialTypeId = json['material_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    uomCode = json['uom_code'];
    plantName = json['plant_name'];
    storageTypeName = json['storage_type_name'];
    storageLocationName = json['storage_location_name'];
    qtyStock = json['qty_stock'];
    storageBinName = json['storage_bin_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['material_code'] = this.materialCode;
    data['material_desc'] = this.materialDesc;
    data['specification'] = this.specification;
    data['uom_id'] = this.uomId;
    data['material_group_id'] = this.materialGroupId;
    data['material_type_id'] = this.materialTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['uom_code'] = this.uomCode;
    data['plant_name'] = this.plantName;
    data['storage_type_name'] = this.storageTypeName;
    data['storage_location_name'] = this.storageLocationName;
    data['qty_stock'] = this.qtyStock;
    return data;
  }
}
