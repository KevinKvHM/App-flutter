class ModelRegionGetId {
  Region? region;

  ModelRegionGetId({this.region});

  ModelRegionGetId.fromJson(Map<String, dynamic> json) {
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
