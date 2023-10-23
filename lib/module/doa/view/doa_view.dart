import 'package:flutter/material.dart';
import 'package:assa_doa/core.dart';
import 'package:get/get.dart';

class DoaView extends StatelessWidget {
  const DoaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoaController>(
      init: DoaController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffFAFAFA),
            elevation: 0,
            actions: const [],
            flexibleSpace: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Doakan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF438E96),
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          left: 40,
                          right: 0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 15.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: TextField(
                            onChanged: (value) {
                              controller.updateFilteredDoa(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Mau cari doa apa?',
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: Color(0xFF438E96),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              color: Color(0xFF438E96),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.filteredDoa.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.filteredDoa[index];
                      return Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Get.to(DoaDetailView(doa: item));
                              },
                              highlightColor: const Color(0xFFD0D0D0),
                              splashColor: const Color(0xFFFFFFFF),
                              hoverColor: const Color(0xFFF2F2F2),
                              focusColor: const Color(0xFFF2F2F2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  left: 15,
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF2F2F2),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFFE5E5E5),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  item["judul"],
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF438E96),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
