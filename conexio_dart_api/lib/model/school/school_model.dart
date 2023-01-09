class SchoolModel {
  Schol? schol;

  SchoolModel({this.schol});

  SchoolModel.fromJson(Map<String, dynamic> json) {
    schol = json['schol'] != null ? new Schol.fromJson(json['schol']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schol != null) {
      data['schol'] = this.schol!.toJson();
    }
    return data;
  }
}

class Schol {
  int? id;
  String? nameSchool;
  String? cct;
  String? nivel;
  String? calle;
  String? noExterior;
  String? numeroInterior;
  String? asentamiento;
  String? email;
  String? telefono;
  int? localidadId;
  String? createdAt;
  String? updatedAt;
  Ubicacion? ubicacion;
  Director? director;
  int? ubicacionId;
  int? directorId;
  int? userId;

  Schol(
      {this.id,
      this.nameSchool,
      this.cct,
      this.nivel,
      this.calle,
      this.noExterior,
      this.numeroInterior,
      this.asentamiento,
      this.email,
      this.telefono,
      this.localidadId,
      this.createdAt,
      this.updatedAt,
      this.ubicacion,
      this.director,
      this.ubicacionId,
      this.directorId,
      this.userId});

  Schol.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSchool = json['name_school'];
    cct = json['cct'];
    nivel = json['nivel'];
    calle = json['calle'];
    noExterior = json['noExterior'];
    numeroInterior = json['numeroInterior'];
    asentamiento = json['asentamiento'];
    email = json['email'];
    telefono = json['telefono'];
    localidadId = json['localidadId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ubicacion = json['ubicacion'] != null
        ? new Ubicacion.fromJson(json['ubicacion'])
        : null;
    director = json['director'] != null
        ? new Director.fromJson(json['director'])
        : null;
    ubicacionId = json['ubicacionId'];
    directorId = json['directorId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_school'] = this.nameSchool;
    data['cct'] = this.cct;
    data['nivel'] = this.nivel;
    data['calle'] = this.calle;
    data['noExterior'] = this.noExterior;
    data['numeroInterior'] = this.numeroInterior;
    data['asentamiento'] = this.asentamiento;
    data['email'] = this.email;
    data['telefono'] = this.telefono;
    data['localidadId'] = this.localidadId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.ubicacion != null) {
      data['ubicacion'] = this.ubicacion!.toJson();
    }
    if (this.director != null) {
      data['director'] = this.director!.toJson();
    }
    data['ubicacionId'] = this.ubicacionId;
    data['directorId'] = this.directorId;
    data['userId'] = this.userId;
    return data;
  }
}

class Ubicacion {
  int? id;
  double? longitud;
  double? latidud;
  String? updatedAt;
  String? createdAt;

  Ubicacion(
      {this.id, this.longitud, this.latidud, this.updatedAt, this.createdAt});

  Ubicacion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    longitud = json['longitud'];
    latidud = json['latidud'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitud'] = this.longitud;
    data['latidud'] = this.latidud;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Director {
  bool? status;
  int? id;
  String? name;
  String? sindicato;
  String? telephone;
  String? puesto;
  String? email;
  String? atencion;
  Supervisor? supervisor;
  String? updatedAt;
  String? createdAt;
  int? supervisorId;

  Director(
      {this.status,
      this.id,
      this.name,
      this.sindicato,
      this.telephone,
      this.puesto,
      this.email,
      this.atencion,
      this.supervisor,
      this.updatedAt,
      this.createdAt,
      this.supervisorId});

  Director.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    name = json['name'];
    sindicato = json['sindicato'];
    telephone = json['telephone'];
    puesto = json['puesto'];
    email = json['email'];
    atencion = json['atencion'];
    supervisor = json['supervisor'] != null
        ? new Supervisor.fromJson(json['supervisor'])
        : null;
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    supervisorId = json['supervisorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['name'] = this.name;
    data['sindicato'] = this.sindicato;
    data['telephone'] = this.telephone;
    data['puesto'] = this.puesto;
    data['email'] = this.email;
    data['atencion'] = this.atencion;
    if (this.supervisor != null) {
      data['supervisor'] = this.supervisor!.toJson();
    }
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['supervisorId'] = this.supervisorId;
    return data;
  }
}

class Supervisor {
  int? id;
  String? name;
  String? telephone;
  String? email;
  String? recuperado;
  String? directorioRecuperado;
  String? updatedAt;
  String? createdAt;

  Supervisor(
      {this.id,
      this.name,
      this.telephone,
      this.email,
      this.recuperado,
      this.directorioRecuperado,
      this.updatedAt,
      this.createdAt});

  Supervisor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    telephone = json['telephone'];
    email = json['email'];
    recuperado = json['recuperado'];
    directorioRecuperado = json['directorio_recuperado'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['recuperado'] = this.recuperado;
    data['directorio_recuperado'] = this.directorioRecuperado;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}


/*class SchoolModel {
  String? nameSchool;
  int? cct;
  String? nivel;
  String? calle;
  int? noExterior;
  String? numeroInterior;
  String? asentamiento;
  String? emailSchool;
  String? telefono;
  int? localidadId;
  String? nameDirector;
  String? sindicato;
  int? telephone;
  String? puesto;
  String? emailDirector;
  String? atencion;
  String? nameSupervisor;
  int? telephoneSupervisor;
  String? emailSupervisor;
  String? recuperado;
  String? directorioRecuperado;

  SchoolModel(
      {this.nameSchool,
      this.cct,
      this.nivel,
      this.calle,
      this.noExterior,
      this.numeroInterior,
      this.asentamiento,
      this.emailSchool,
      this.telefono,
      this.localidadId,
      this.nameDirector,
      this.sindicato,
      this.telephone,
      this.puesto,
      this.emailDirector,
      this.atencion,
      this.nameSupervisor,
      this.telephoneSupervisor,
      this.emailSupervisor,
      this.recuperado,
      this.directorioRecuperado});

  SchoolModel.fromJson(Map<String, dynamic> json) {
    nameSchool = json['name_school'];
    cct = json['cct'];
    nivel = json['nivel'];
    calle = json['calle'];
    noExterior = json['noExterior'];
    numeroInterior = json['numeroInterior'];
    asentamiento = json['asentamiento'];
    emailSchool = json['email_school'];
    telefono = json['telefono'];
    localidadId = json['localidadId'];
    nameDirector = json['name_director'];
    sindicato = json['sindicato'];
    telephone = json['telephone'];
    puesto = json['puesto'];
    emailDirector = json['email_director'];
    atencion = json['atencion'];
    nameSupervisor = json['name_supervisor'];
    telephoneSupervisor = json['telephone_supervisor'];
    emailSupervisor = json['email_supervisor'];
    recuperado = json['recuperado'];
    directorioRecuperado = json['directorio_recuperado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_school'] = this.nameSchool;
    data['cct'] = this.cct;
    data['nivel'] = this.nivel;
    data['calle'] = this.calle;
    data['noExterior'] = this.noExterior;
    data['numeroInterior'] = this.numeroInterior;
    data['asentamiento'] = this.asentamiento;
    data['email_school'] = this.emailSchool;
    data['telefono'] = this.telefono;
    data['localidadId'] = this.localidadId;
    data['name_director'] = this.nameDirector;
    data['sindicato'] = this.sindicato;
    data['telephone'] = this.telephone;
    data['puesto'] = this.puesto;
    data['email_director'] = this.emailDirector;
    data['atencion'] = this.atencion;
    data['name_supervisor'] = this.nameSupervisor;
    data['telephone_supervisor'] = this.telephoneSupervisor;
    data['email_supervisor'] = this.emailSupervisor;
    data['recuperado'] = this.recuperado;
    data['directorio_recuperado'] = this.directorioRecuperado;
    return data;
  }
}
*/