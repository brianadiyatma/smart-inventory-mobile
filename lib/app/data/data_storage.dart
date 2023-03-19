class Storage {
  int? currentPage;
  List<StorageContent>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Storage(
      {this.currentPage,
      this.data,
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
      this.total});

  Storage.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <StorageContent>[];
      json['data'].forEach((v) {
        data!.add(new StorageContent.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class StorageContent {
  int? id;
  String? plantCode;
  String? storageLocCode;
  String? storageTypeCode;
  String? storageBinCode;
  String? storageBinName;
  String? createdAt;
  String? updatedAt;
  String? storageLocationName;
  String? storageTypeName;
  int? totalProject;
  int? totalMaterialType;
  int? totalMaterialProject;
  int? totalMaterial;

  StorageContent(
      {this.id,
      this.plantCode,
      this.storageLocCode,
      this.storageTypeCode,
      this.storageBinCode,
      this.storageBinName,
      this.createdAt,
      this.updatedAt,
      this.storageLocationName,
      this.storageTypeName,
      this.totalProject,
      this.totalMaterialType,
      this.totalMaterialProject,
      this.totalMaterial});

  StorageContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantCode = json['plant_code'];
    storageLocCode = json['storage_loc_code'];
    storageTypeCode = json['storage_type_code'];
    storageBinCode = json['storage_bin_code'];
    storageBinName = json['storage_bin_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    storageLocationName = json['storage_location_name'];
    storageTypeName = json['storage_type_name'];
    totalProject = json['total_project'];
    totalMaterialType = json['total_material_type'];
    totalMaterialProject = json['total_material_project'];
    totalMaterial = json['total_material'];
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
    data['storage_location_name'] = this.storageLocationName;
    data['storage_type_name'] = this.storageTypeName;
    data['total_project'] = this.totalProject;
    data['total_material_type'] = this.totalMaterialType;
    data['total_material_project'] = this.totalMaterialProject;
    data['total_material'] = this.totalMaterial;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
