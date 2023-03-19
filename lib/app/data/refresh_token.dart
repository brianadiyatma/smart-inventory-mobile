class Refresh {
  String? token;
  String? expirateAt;

  Refresh({this.token, this.expirateAt});

  Refresh.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expirateAt = json['expirate_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expirate_at'] = this.expirateAt;
    return data;
  }
}
