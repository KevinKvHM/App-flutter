class SaresCreateModels {
  String? idSare;
  String? email;
  String? nameSare;
  String? nameJefeSare;
  String? domicilio;
  String? telefono;
  List<int>? region;
  double? latitud;
  double? longitud;
  int? localidadId;

  SaresCreateModels(
      {this.idSare,
      this.email,
      this.nameSare,
      this.nameJefeSare,
      this.domicilio,
      this.telefono,
      this.region,
      this.latitud,
      this.longitud,
      this.localidadId});

  SaresCreateModels.fromJson(Map<String, dynamic> json) {
    idSare = json['idSare'];
    email = json['email'];
    nameSare = json['nameSare'];
    nameJefeSare = json['nameJefeSare'];
    domicilio = json['domicilio'];
    telefono = json['telefono'];
    region = json['region'].cast<int>();
    latitud = json['latitud'];
    longitud = json['longitud'];
    localidadId = json['localidadId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSare'] = this.idSare;
    data['email'] = this.email;
    data['nameSare'] = this.nameSare;
    data['nameJefeSare'] = this.nameJefeSare;
    data['domicilio'] = this.domicilio;
    data['telefono'] = this.telefono;
    data['region'] = this.region;
    data['latitud'] = this.latitud;
    data['longitud'] = this.longitud;
    data['localidadId'] = this.localidadId;
    return data;
  }
}
