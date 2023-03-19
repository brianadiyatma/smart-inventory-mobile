class DashboardV2 {
  String? status;
  Data? data;

  DashboardV2({this.status, this.data});

  DashboardV2.fromJson(Map<String, dynamic> json) {
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
  List<Header>? header;
  List<TransactionNot>? transactionNot;
  List<TransactionToday>? transactionToday;
  Performance? performance;

  Data(
      {this.header,
      this.transactionNot,
      this.transactionToday,
      this.performance});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['header'] != null) {
      header = <Header>[];
      json['header'].forEach((v) {
        header!.add(new Header.fromJson(v));
      });
    }
    if (json['transactionNot'] != null) {
      transactionNot = <TransactionNot>[];
      json['transactionNot'].forEach((v) {
        transactionNot!.add(new TransactionNot.fromJson(v));
      });
    }
    if (json['transactionToday'] != null) {
      transactionToday = <TransactionToday>[];
      json['transactionToday'].forEach((v) {
        transactionToday!.add(new TransactionToday.fromJson(v));
      });
    }
    performance = json['performance'] != null
        ? new Performance.fromJson(json['performance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header!.map((v) => v.toJson()).toList();
    }
    if (this.transactionNot != null) {
      data['transactionNot'] =
          this.transactionNot!.map((v) => v.toJson()).toList();
    }
    if (this.transactionToday != null) {
      data['transactionToday'] =
          this.transactionToday!.map((v) => v.toJson()).toList();
    }
    if (this.performance != null) {
      data['performance'] = this.performance!.toJson();
    }
    return data;
  }
}

class Header {
  String? type;
  int? count;

  Header({this.type, this.count});

  Header.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['count'] = this.count;
    return data;
  }
}

class TransactionNot {
  String? docNumber;
  String? docDate;
  String? status;
  String? pembuat;
  String? fiscalYear;
  String? type;
  int? countItem;

  TransactionNot(
      {this.docNumber,
      this.docDate,
      this.status,
      this.pembuat,
      this.fiscalYear,
      this.type,
      this.countItem});

  TransactionNot.fromJson(Map<String, dynamic> json) {
    docNumber = json['doc_number'];
    docDate = json['doc_date'];
    status = json['status'];
    pembuat = json['pembuat'];
    fiscalYear = json['fiscal_year'];
    type = json['type'];
    countItem = json['count_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_number'] = this.docNumber;
    data['doc_date'] = this.docDate;
    data['status'] = this.status;
    data['pembuat'] = this.pembuat;
    data['fiscal_year'] = this.fiscalYear;
    data['type'] = this.type;
    data['count_item'] = this.countItem;
    return data;
  }
}

class TransactionToday {
  String? docNumber;
  String? docDate;
  String? status;
  String? pembuat;
  String? fiscalYear;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? countItem;

  TransactionToday(
      {this.docNumber,
      this.docDate,
      this.status,
      this.pembuat,
      this.fiscalYear,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.countItem});

  TransactionToday.fromJson(Map<String, dynamic> json) {
    docNumber = json['doc_number'];
    docDate = json['doc_date'];
    status = json['status'];
    pembuat = json['pembuat'];
    fiscalYear = json['fiscal_year'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countItem = json['count_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_number'] = this.docNumber;
    data['doc_date'] = this.docDate;
    data['status'] = this.status;
    data['pembuat'] = this.pembuat;
    data['fiscal_year'] = this.fiscalYear;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['count_item'] = this.countItem;
    return data;
  }
}

class Performance {
  String? laborHours;
  int? countItem;

  Performance({this.laborHours, this.countItem});

  Performance.fromJson(Map<String, dynamic> json) {
    laborHours = json['labor_hours'];
    countItem = json['count_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labor_hours'] = this.laborHours;
    data['count_item'] = this.countItem;
    return data;
  }
}
