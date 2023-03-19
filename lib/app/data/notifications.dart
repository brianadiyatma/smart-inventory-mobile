class Notifications {
  int? currentPage;
  List<Notification>? data;
  int? lastPage;
  int? perPage;
  int? total;

  Notifications(
      {this.currentPage, this.data, this.lastPage, this.perPage, this.total});

  Notifications.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Notification>[];
      json['data'].forEach((v) {
        data!.add(new Notification.fromJson(v));
      });
    }
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['last_page'] = this.lastPage;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    return data;
  }
}

class Notification {
  String? userId;
  String? notifikasiId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? title;
  String? body;

  Notification(
      {this.userId,
      this.notifikasiId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.title,
      this.body});

  Notification.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'].toString();
    notifikasiId = json['notifikasi_id'].toString();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'].toString();
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['notifikasi_id'] = this.notifikasiId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
