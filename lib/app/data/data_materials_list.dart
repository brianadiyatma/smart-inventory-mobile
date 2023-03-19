class Materials {
  int? currentPage;
  List<MaterialContent>? content;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;

  int? to;
  int? total;

  Materials(
      {this.currentPage,
      this.content,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Materials.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      content = <MaterialContent>[];
      json['data'].forEach((v) {
        content!.add(new MaterialContent.fromJson(v));
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

    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.content != null) {
      data['data'] = this.content!.map((v) => v.toJson()).toList();
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

    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class MaterialContent {
  String? materialCode;
  String? materialDesc;
  String? specialStockNumber;
  String? qtyStock;
  String? uom;

  MaterialContent(
      {this.materialCode,
      this.materialDesc,
      this.specialStockNumber,
      this.uom,
      this.qtyStock});

  MaterialContent.fromJson(Map<String, dynamic> json) {
    materialCode = json['material_code'];
    materialDesc = json['material_desc'];
    specialStockNumber = json['special_stock_number'];
    qtyStock = json['qty_stock'].toString();
    uom = json['uom_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['material_code'] = this.materialCode;
    data['material_desc'] = this.materialDesc;
    data['special_stock_number'] = this.specialStockNumber;
    data['qty_stock'] = this.qtyStock;
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
