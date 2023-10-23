import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  bool respError;
  String respMsg;
  String username;
  String nama;
  String alamat;
  String kota;
  String telp;
  String email;
  String avatar;
  String level;
  String device;

  ModelUser({
    required this.respError,
    required this.respMsg,
    required this.username,
    required this.nama,
    required this.alamat,
    required this.kota,
    required this.telp,
    required this.email,
    required this.avatar,
    required this.level,
    required this.device,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        respError: json["resp_error"],
        respMsg: json["resp_msg"],
        username: json["username"],
        nama: json["nama"],
        alamat: json["alamat"],
        kota: json["kota"],
        telp: json["telp"],
        email: json["email"],
        avatar: json["avatar"],
        level: json["level"],
        device: json["device"],
      );

  Map<String, dynamic> toJson() => {
        "resp_error": respError,
        "resp_msg": respMsg,
        "username": username,
        "nama": nama,
        "alamat": alamat,
        "kota": kota,
        "telp": telp,
        "email": email,
        "avatar": avatar,
        "level": level,
        "device": device,
      };
}
