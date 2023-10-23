import 'package:flutter/material.dart';
import '../controller/doa_detail_controller.dart';
import 'package:assa_doa/core.dart';
import 'package:get/get.dart';

class DoaDetailView extends StatelessWidget {
  final Map doa;
  const DoaDetailView({Key? key, required this.doa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoaDetailController>(
      init: DoaDetailController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 0,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Kembali",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF438E96),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      child: Text(
                        doa["judul"],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF438E96),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            doa["arab"],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '"${doa["latin"]}"',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Artinya :",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      '"${doa["terjemah"]}"',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
