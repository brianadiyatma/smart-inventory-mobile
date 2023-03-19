class HistoryMaterial {
  int? currentPage;
  List<HistoryContent>? historyContent;
  String? firstPageUrl;
  int? from;
  int? lastPage;

  HistoryMaterial(
      {this.currentPage,
      this.historyContent,
      this.firstPageUrl,
      this.from,
      this.lastPage});

  HistoryMaterial.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      historyContent = <HistoryContent>[];
      json['data'].forEach((v) {
        historyContent!.add(new HistoryContent.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.historyContent != null) {
      data['HistoryContent'] =
          this.historyContent!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    return data;
  }
}

class HistoryContent {
  String? docNumber;
  String? enterDate;
  String? qty;
  String? uom;
  String? plantName;
  String? storageTypeName;
  String? storageLocationName;
  String? storageBinCode;
  String? type;

  HistoryContent(
      {this.docNumber,
      this.enterDate,
      this.qty,
      this.uom,
      this.plantName,
      this.storageTypeName,
      this.storageLocationName,
      this.storageBinCode,
      this.type});

  HistoryContent.fromJson(Map<String, dynamic> json) {
    docNumber = json['doc_number'];
    enterDate = json['enter_date'];
    qty = json['qty'];
    uom = json['uom'];
    plantName = json['plant_name'];
    storageTypeName = json['storage_type_name'];
    storageLocationName = json['storage_location_name'];
    storageBinCode = json['storage_bin_code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_number'] = this.docNumber;
    data['enter_date'] = this.enterDate;
    data['qty'] = this.qty;
    data['uom'] = this.uom;
    data['plant_name'] = this.plantName;
    data['storage_type_name'] = this.storageTypeName;
    data['storage_location_name'] = this.storageLocationName;
    data['storage_bin_code'] = this.storageBinCode;
    data['type'] = this.type;
    return data;
  }
}
