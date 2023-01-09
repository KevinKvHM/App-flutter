class SaresModel {
  List<Sares>? sares;

  SaresModel({this.sares});

  SaresModel.fromJson(Map<String, dynamic> json) {
    if (json['sares'] != null) {
      sares = <Sares>[];
      json['sares'].forEach((v) {
        sares!.add(new Sares.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sares != null) {
      data['sares'] = this.sares!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sares {
  int? id;
  String? idSare;
  String? nameSare;
  String? nameJefeSare;
  String? telefono;
  String? email;
  double? longitud;
  double? latitud;
  int? localidadId;
  String? createdAt;
  String? updatedAt;
  List<Regions>? regions;
  Localidad? localidad;

  Sares(
      {this.id,
      this.idSare,
      this.nameSare,
      this.nameJefeSare,
      this.telefono,
      this.email,
      this.longitud,
      this.latitud,
      this.localidadId,
      this.createdAt,
      this.updatedAt,
      this.regions,
      this.localidad});

  Sares.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSare = json['idSare'];
    nameSare = json['nameSare'];
    nameJefeSare = json['nameJefeSare'];
    telefono = json['telefono'];
    email = json['email'];
    longitud = json['longitud'];
    latitud = json['latitud'];
    localidadId = json['localidadId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add(new Regions.fromJson(v));
      });
    }
    localidad = json['localidad'] != null
        ? new Localidad.fromJson(json['localidad'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idSare'] = this.idSare;
    data['nameSare'] = this.nameSare;
    data['nameJefeSare'] = this.nameJefeSare;
    data['telefono'] = this.telefono;
    data['email'] = this.email;
    data['longitud'] = this.longitud;
    data['latitud'] = this.latitud;
    data['localidadId'] = this.localidadId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.regions != null) {
      data['regions'] = this.regions!.map((v) => v.toJson()).toList();
    }
    if (this.localidad != null) {
      data['localidad'] = this.localidad!.toJson();
    }
    return data;
  }
}

class Regions {
  int? id;
  String? nameRegion;
  String? createdAt;
  String? updatedAt;
  RegionesSares? regionesSares;

  Regions(
      {this.id,
      this.nameRegion,
      this.createdAt,
      this.updatedAt,
      this.regionesSares});

  Regions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRegion = json['nameRegion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    regionesSares = json['regiones_sares'] != null
        ? new RegionesSares.fromJson(json['regiones_sares'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameRegion'] = this.nameRegion;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.regionesSares != null) {
      data['regiones_sares'] = this.regionesSares!.toJson();
    }
    return data;
  }
}

class RegionesSares {
  String? createdAt;
  String? updatedAt;
  int? regionId;
  int? sareId;

  RegionesSares({this.createdAt, this.updatedAt, this.regionId, this.sareId});

  RegionesSares.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    regionId = json['regionId'];
    sareId = json['sareId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['regionId'] = this.regionId;
    data['sareId'] = this.sareId;
    return data;
  }
}

class Localidad {
  int? id;
  String? nameLoc;
  int? claveLocOfi;
  int? municipioId;
  String? createdAt;
  String? updatedAt;
  Municipio? municipio;

  Localidad(
      {this.id,
      this.nameLoc,
      this.claveLocOfi,
      this.municipioId,
      this.createdAt,
      this.updatedAt,
      this.municipio});

  Localidad.fromJson(Map<String, dynamic> json) {
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
  Region? region;

  Municipio(
      {this.id,
      this.name,
      this.regionId,
      this.createdAt,
      this.updatedAt,
      this.region});

  Municipio.fromJson(Map<String, dynamic> json) {
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

/*class SaresModel {
  List<Sares>? sares;

  SaresModel({this.sares});

  SaresModel.fromJson(Map<String, dynamic> json) {
    if (json['sares'] != null) {
      sares = <Sares>[];
      json['sares'].forEach((v) {
        sares!.add(new Sares.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sares != null) {
      data['sares'] = this.sares!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sares {
  int? id;
  String? idSare;
  String? nameSare;
  String? nameJefeSare;
  String? telefono;
  String? email;
  double? longitud;
  double? latitud;
  int? localidadId;
  String? createdAt;
  String? updatedAt;
  Localidad? localidad;

  Sares(
      {this.id,
      this.idSare,
      this.nameSare,
      this.nameJefeSare,
      this.telefono,
      this.email,
      this.longitud,
      this.latitud,
      this.localidadId,
      this.createdAt,
      this.updatedAt,
      this.localidad});

  Sares.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSare = json['idSare'];
    nameSare = json['nameSare'];
    nameJefeSare = json['nameJefeSare'];
    telefono = json['telefono'];
    email = json['email'];
    longitud = json['longitud'];
    latitud = json['latitud'];
    localidadId = json['localidadId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    localidad = json['localidad'] != null
        ? new Localidad.fromJson(json['localidad'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idSare'] = this.idSare;
    data['nameSare'] = this.nameSare;
    data['nameJefeSare'] = this.nameJefeSare;
    data['telefono'] = this.telefono;
    data['email'] = this.email;
    data['longitud'] = this.longitud;
    data['latitud'] = this.latitud;
    data['localidadId'] = this.localidadId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.localidad != null) {
      data['localidad'] = this.localidad!.toJson();
    }
    return data;
  }
}

class Localidad {
  int? id;
  String? nameLoc;
  int? claveLocOfi;
  int? municipioId;
  String? createdAt;
  String? updatedAt;
  Municipio? municipio;

  Localidad(
      {this.id,
      this.nameLoc,
      this.claveLocOfi,
      this.municipioId,
      this.createdAt,
      this.updatedAt,
      this.municipio});

  Localidad.fromJson(Map<String, dynamic> json) {
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
  Region? region;

  Municipio(
      {this.id,
      this.name,
      this.regionId,
      this.createdAt,
      this.updatedAt,
      this.region});

  Municipio.fromJson(Map<String, dynamic> json) {
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
*/