class GudangType {
  String? status;
  List<Type>? data;

  GudangType({this.status, this.data});

  GudangType.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Type>[];
      json['data'].forEach((v) {
        data!.add(new Type.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Type {
  int? id;
  String? plantCode;
  String? storageLocCode;
  String? storageTypeCode;
  String? storageBinCode;
  String? storageBinName;
  String? createdAt;
  String? updatedAt;
  String? storageTypeName;

  Type(
      {this.id,
      this.plantCode,
      this.storageLocCode,
      this.storageTypeCode,
      this.storageBinCode,
      this.storageBinName,
      this.createdAt,
      this.updatedAt,
      this.storageTypeName});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantCode = json['plant_code'];
    storageLocCode = json['storage_loc_code'];
    storageTypeCode = json['storage_type_code'];
    storageBinCode = json['storage_bin_code'];
    storageBinName = json['storage_bin_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    storageTypeName = json['storage_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plant_code'] = this.plantCode;
    data['storage_loc_code'] = this.storageLocCode;
    data['storage_type_code'] = this.storageTypeCode;
    data['storage_bin_code'] = this.storageBinCode;
    data['storage_bin_name'] = this.storageBinName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['storage_type_name'] = this.storageTypeName;
    return data;
  }
}
