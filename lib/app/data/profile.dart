class Profile {
  String? status;
  String? message;
  User? user;

  Profile({this.status, this.message, this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? url;
  String? nip;
  int? divisionCode;
  int? positionCode;
  int? plantCode;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Plant? plant;
  Division? division;
  Position? position;
  List<Roles>? roles;

  User(
      {this.id,
      this.url,
      this.nip,
      this.divisionCode,
      this.positionCode,
      this.plantCode,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.plant,
      this.division,
      this.position,
      this.roles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    nip = json['nip'];
    divisionCode = json['division_code'];
    positionCode = json['position_code'];
    plantCode = json['plant_code'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['nip'] = this.nip;
    data['division_code'] = this.divisionCode;
    data['position_code'] = this.positionCode;
    data['plant_code'] = this.plantCode;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.plant != null) {
      data['plant'] = this.plant!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
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
  Null? deletedAt;

  Plant(
      {this.id,
      this.plantCode,
      this.plantName,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantCode = json['plant_code'];
    plantName = json['plant_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plant_code'] = this.plantCode;
    data['plant_name'] = this.plantName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
  Null? deletedAt;

  Division(
      {this.id,
      this.divisionCode,
      this.parentDivisionCode,
      this.divisionName,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionCode = json['division_code'];
    parentDivisionCode = json['parent_division_code'];
    divisionName = json['division_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_code'] = this.divisionCode;
    data['parent_division_code'] = this.parentDivisionCode;
    data['division_name'] = this.divisionName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Position {
  int? id;
  String? positionCode;
  String? positionName;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Position(
      {this.id,
      this.positionCode,
      this.positionName,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    positionCode = json['position_code'];
    positionName = json['position_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position_code'] = this.positionCode;
    data['position_name'] = this.positionName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
      this.name,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    data['model_type'] = this.modelType;
    return data;
  }
}
