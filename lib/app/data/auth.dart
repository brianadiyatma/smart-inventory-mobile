//GENERATED PLEASE DO NOT CHANGE

class Auth {
  String? status;
  String? message;
  User? user;
  String? token;

  Auth({this.status, this.message, this.user, this.token});

  Auth.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? nip;
  String? divisionCode;
  String? positionCode;
  String? plantCode;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Plant? plant;
  Division? division;
  Position? position;

  User(
      {this.id,
      this.nip,
      this.divisionCode,
      this.positionCode,
      this.plantCode,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.plant,
      this.division,
      this.position});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nip = json['nip'];
    divisionCode = json['division_code'].toString();
    positionCode = json['position_code'].toString();
    plantCode = json['plant_code'].toString();
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nip'] = this.nip;
    data['division_code'] = this.divisionCode;
    data['position_code'] = this.positionCode;
    data['plant_code'] = this.plantCode;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.plant != null) {
      data['plant'] = this.plant!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    return data;
  }
}

class Plant {
  int? id;
  String? plantCode;
  String? plantName;
  String? createdAt;
  String? updatedAt;

  Plant(
      {this.id,
      this.plantCode,
      this.plantName,
      this.createdAt,
      this.updatedAt});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantCode = json['plant_code'];
    plantName = json['plant_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plant_code'] = this.plantCode;
    data['plant_name'] = this.plantName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Division {
  int? id;
  String? divisionCode;
  String? parentDivisionCode;
  String? divisionName;
  String? createdAt;
  String? updatedAt;

  Division(
      {this.id,
      this.divisionCode,
      this.parentDivisionCode,
      this.divisionName,
      this.createdAt,
      this.updatedAt});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionCode = json['division_code'];
    parentDivisionCode = json['parent_division_code'];
    divisionName = json['division_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_code'] = this.divisionCode;
    data['parent_division_code'] = this.parentDivisionCode;
    data['division_name'] = this.divisionName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Position {
  int? id;
  String? positionCode;
  String? positionName;
  String? createdAt;
  String? updatedAt;

  Position(
      {this.id,
      this.positionCode,
      this.positionName,
      this.createdAt,
      this.updatedAt});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    positionCode = json['position_code'];
    positionName = json['position_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position_code'] = this.positionCode;
    data['position_name'] = this.positionName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
