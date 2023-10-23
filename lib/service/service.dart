import 'package:assa_doa/service/auth_service.dart';

class Service {
  static String baseUrl = "https://demo.sidnet.co.id";

  static String key = "sidnet.kudus";

  static Map<String, String> headers = {
    "key": key,
  };

  static Map<String, String> headersUser() {
    return {
      "key": key,
      "username": AuthService.currentUser!.username,
    };
  }
}
