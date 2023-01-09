/*class RegionModelGet {
  List<Regiones>? regiones;

  RegionModelGet({this.regiones});

  RegionModelGet.fromJson(Map<String, dynamic> json) {
    if (json['regiones'] != null) {
      regiones = <Regiones>[];
      json['regiones'].forEach((v) {
        regiones!.add(new Regiones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.regiones != null) {
      data['regiones'] = this.regiones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Regiones {
  int? id;
  String? nameRegion;
  String? createdAt;
  String? updatedAt;

  Regiones({this.id, this.nameRegion, this.createdAt, this.updatedAt});

  Regiones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRegion = json['nameRegion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameRegion'] = this.nameRegion;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}*/
class RegionModelGet {
  List<Regiones>? regiones;

  RegionModelGet({this.regiones});

  RegionModelGet.fromJson(Map<String, dynamic> json) {
    if (json['regiones'] != null) {
      regiones = <Regiones>[];
      json['regiones'].forEach((v) {
        regiones!.add(new Regiones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.regiones != null) {
      data['regiones'] = this.regiones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Regiones {
  int? id;
  String? nameRegion;
  String? nameJefeSare;
  String? createdAt;
  String? updatedAt;

  Regiones(
      {this.id,
      this.nameRegion,
      this.nameJefeSare,
      this.createdAt,
      this.updatedAt});

  Regiones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRegion = json['nameRegion'];
    nameJefeSare = json['nameJefeSare'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameRegion'] = this.nameRegion;
    data['nameJefeSare'] = this.nameJefeSare;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
