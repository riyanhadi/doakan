import 'dart:io';

import 'package:assa_doa/model/model_user.dart';
import 'package:assa_doa/service/local_data_service.dart';
import 'package:assa_doa/service/service.dart';
import 'package:dio/dio.dart';

class AuthService {
  static ModelUser? currentUser;

  static Future<Map<String, dynamic>> daftar({
    String? nama,
    String? alamat,
    String? kota,
    String? telp,
    String? email,
    String? password,
  }) async {
    try {
      var response = await Dio().post(
        "${Service.baseUrl}/api/mobile/daftar",
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: Service.headers,
        ),
        data: FormData.fromMap({
          "nama": nama,
          "alamat": alamat,
          "kota": kota,
          "telp": telp,
          "email": email,
          "password": password,
        }),
      );
      Map<String, dynamic> obj = response.data;

      return {'status': true, 'pesan': obj["resp_msg"]};
    } on DioException catch (e) {
      if (e.response != null) {
        final Map<String, dynamic> obj =
            e.response!.data as Map<String, dynamic>;
        return {
          'status': false,
          'pesan': obj["resp_msg"] ?? obj["error"],
        };
      } else {
        return {
          'status': false,
          'pesan': e.message!,
        };
      }
    }
  }

  static Future<Map<String, dynamic>> login({
    String? username,
    String? password,
  }) async {
    try {
      var response = await Dio().post(
        "${Service.baseUrl}/api/mobile/login",
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: Service.headers,
        ),
        data: FormData.fromMap({
          "username": username,
          "password": password,
        }),
      );
      Map<String, dynamic> obj = response.data;

      currentUser = ModelUser.fromJson(obj);
      LocalDataService.saveUser(currentUser!.toJson());

      return {'status': true, 'pesan': ''};
    } on DioException catch (e) {
      if (e.response != null) {
        final Map<String, dynamic> obj =
            e.response!.data as Map<String, dynamic>;
        return {
          'status': false,
          'pesan': obj["resp_msg"] ?? obj["error"],
        };
      } else {
        return {
          'status': false,
          'pesan': e.message!,
        };
      }
    }
  }

  static Future<Map<String, dynamic>> updateAvatars({
    required foto,
  }) async {
    try {
      final formData = FormData.fromMap({
        'foto': MultipartFile.fromBytes(
          File(foto).readAsBytesSync(),
          filename: "upload.jpg",
        ),
      });

      final response = await Dio().post(
        "${Service.baseUrl}/api/mobile/updateavatar",
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: Service.headersUser(),
        ),
        data: formData,
      );

      Map<String, dynamic> obj = response.data;

      currentUser!.avatar = obj["avatar"];
      LocalDataService.saveUser(currentUser!.toJson());

      return {'status': true, 'pesan': ""};
    } on DioException catch (e) {
      if (e.response != null) {
        final Map<String, dynamic> obj =
            e.response!.data as Map<String, dynamic>;
        return {
          'status': false,
          'pesan': obj["resp_msg"] ?? obj["error"],
        };
      } else {
        return {
          'status': false,
          'pesan': e.message!,
        };
      }
    }
  }

  static Future<Map<String, dynamic>> updateProfil({
    required String nama,
    required String alamat,
    required String kota,
    required String telp,
  }) async {
    try {
      final response = await Dio().post(
        "${Service.baseUrl}/api/mobile/updateprofil",
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: Service.headersUser(),
        ),
        data: FormData.fromMap({
          "nama": nama,
          "alamat": alamat,
          "kota": kota,
          "telp": telp,
        }),
      );
      Map<String, dynamic> obj = response.data;

      currentUser!.nama = nama;
      currentUser!.alamat = alamat;
      currentUser!.kota = kota;
      currentUser!.telp = telp;
      LocalDataService.saveUser(currentUser!.toJson());

      return {'status': true, 'pesan': obj["resp_msg"]};
    } on DioException catch (e) {
      if (e.response != null) {
        final Map<String, dynamic> obj =
            e.response!.data as Map<String, dynamic>;
        return {
          'status': false,
          'pesan': obj["resp_msg"] ?? obj["error"],
        };
      } else {
        return {
          'status': false,
          'pesan': e.message!,
        };
      }
    }
  }

  static Future<Map<String, dynamic>> updatePassword({
    required String password,
    required String konfirm,
  }) async {
    try {
      final response = await Dio().post(
        "${Service.baseUrl}/api/mobile/gantipassword",
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: Service.headersUser(),
        ),
        data: FormData.fromMap({
          "password": password,
          "konfirm": konfirm,
        }),
      );
      Map obj = response.data;

      return {'status': true, 'pesan': obj};
    } on DioException catch (e) {
      if (e.response != null) {
        final Map<String, dynamic> obj =
            e.response!.data as Map<String, dynamic>;
        return {
          'status': false,
          'pesan': obj["resp_msg"] ?? obj["error"],
        };
      } else {
        return {
          'status': false,
          'pesan': e.message!,
        };
      }
    }
  }

  static logout() async {
    await LocalDataService.clearPref();
  }
}
