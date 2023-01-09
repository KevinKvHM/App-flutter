class EmployeeModel {
  int? id;
  String? fullName;
  String? email;
  String? numberPhone;
  String? oficina;
  User? user;

  EmployeeModel(
      {this.id,
      this.fullName,
      this.email,
      this.numberPhone,
      this.oficina,
      this.user});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    numberPhone = json['number_phone'];
    oficina = json['oficina'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['number_phone'] = this.numberPhone;
    data['oficina'] = this.oficina;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? password;
  int? roleId;
  int? employeeId;

  User({this.id, this.email, this.password, this.roleId, this.employeeId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    roleId = json['roleId'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['roleId'] = this.roleId;
    data['employeeId'] = this.employeeId;
    return data;
  }
}
