class LocalidadModelGet {
  List<Localidades>? localidades;

  LocalidadModelGet({this.localidades});

  LocalidadModelGet.fromJson(Map<String, dynamic> json) {
    if (json['localidades'] != null) {
      localidades = <Localidades>[];
      json['localidades'].forEach((v) {
        localidades!.add(new Localidades.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.localidades != null) {
      data['localidades'] = this.localidades!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Localidades {
  int? id;
  String? nameLoc;
  int? claveLocOfi;
  int? municipioId;
  String? createdAt;
  String? updatedAt;
  Municipio? municipio;

  Localidades(
      {this.id,
      this.nameLoc,
      this.claveLocOfi,
      this.municipioId,
      this.createdAt,
      this.updatedAt,
      this.municipio});

  Localidades.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameLoc = json['nameLoc'];
    claveLocOfi = json['claveLocOfi'];
    municipioId = json['municipioId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    municipio = json['municipio'] != null
        ? new Municipio.fromJson(json['municipio'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameLoc'] = this.nameLoc;
    data['claveLocOfi'] = this.claveLocOfi;
    data['municipioId'] = this.municipioId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.municipio != null) {
      data['municipio'] = this.municipio!.toJson();
    }
    return data;
  }
}

class Municipio {
  int? id;
  String? name;
  int? regionId;
  String? createdAt;
  String? updatedAt;

  Municipio(
      {this.id, this.name, this.regionId, this.createdAt, this.updatedAt});

  Municipio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionId = json['regionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['regionId'] = this.regionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
