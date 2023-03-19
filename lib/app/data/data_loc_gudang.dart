class Loc {
  String? status;
  List<Data>? data;

  Loc({this.status, this.data});

  Loc.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? storageLocationCode;
  String? storageLocationName;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.storageLocationCode,
      this.storageLocationName,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storageLocationCode = json['storage_location_code'];
    storageLocationName = json['storage_location_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storage_location_code'] = this.storageLocationCode;
    data['storage_location_name'] = this.storageLocationName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
