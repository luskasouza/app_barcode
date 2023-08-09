import 'dart:convert';

class Register {
  late final int id;
  late final String code;
  late final String status;

  Register(
    this.id,
    this.code,
    this.status,
  );

  Register.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
  }

  @override
  String toString() {
    Map map = {
      "id": id,
      "code": code,
      "status": status,
    };
    var result = jsonEncode(map);
    return (result);
  }
}
