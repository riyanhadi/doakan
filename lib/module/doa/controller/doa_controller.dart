import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../view/doa_view.dart';

class DoaController extends GetxController {
  DoaView? view;

  @override
  void onInit() {
    getDoa();
    super.onInit();
  }

  List<dynamic> doa = [];
  List<dynamic> filteredDoa = [];

  getDoa() async {
    var response = await Dio().get(
      "https://open-api.my.id/api/doa",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    doa = response.data;
    updateFilteredDoa("");
    update();
  }

  updateFilteredDoa(String searchText) {
    filteredDoa = doa.where((item) {
      String doaText = item["judul"].toString().toLowerCase();
      return doaText.contains(searchText.toLowerCase());
    }).toList();
    update();
  }
}
