class MunicipioModelGet {
  List<Municipios>? municipios;

  MunicipioModelGet({this.municipios});

  MunicipioModelGet.fromJson(Map<String, dynamic> json) {
    if (json['municipios'] != null) {
      municipios = <Municipios>[];
      json['municipios'].forEach((v) {
        municipios!.add(new Municipios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.municipios != null) {
      data['municipios'] = this.municipios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Municipios {
  int? id;
  String? name;
  int? regionId;
  String? createdAt;
  String? updatedAt;
  Region? region;

  Municipios(
      {this.id,
      this.name,
      this.regionId,
      this.createdAt,
      this.updatedAt,
      this.region});

  Municipios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionId = json['regionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['regionId'] = this.regionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    return data;
  }
}

class Region {
  int? id;
  String? nameRegion;
  String? createdAt;
  String? updatedAt;

  Region({this.id, this.nameRegion, this.createdAt, this.updatedAt});

  Region.fromJson(Map<String, dynamic> json) {
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
}
