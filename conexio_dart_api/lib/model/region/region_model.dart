/*class RegionModel {
  String? nameRegion;

  RegionModel({this.nameRegion});

  RegionModel.fromJson(Map<String, dynamic> json) {
    nameRegion = json['nameRegion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameRegion'] = this.nameRegion;
    return data;
  }
}*/
class RegionModel {
  int? id;
  String? nameRegion;
  String? nameJefeSare;
  String? createdAt;
  String? updatedAt;

  RegionModel(
      {this.id,
      this.nameRegion,
      this.nameJefeSare,
      this.createdAt,
      this.updatedAt});

  RegionModel.fromJson(Map<String, dynamic> json) {
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
