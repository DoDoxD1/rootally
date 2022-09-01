import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rootally/controllers/sessions_controller.dart';

class TodayProgressWidget extends StatelessWidget {
  final SessionController controller = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffbababa), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Progress",
                    style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff707070))),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    // Calculate(controller.names.length),
                    "${(controller.completed()*100/controller.names.length).toInt()}%",
                    style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF335cc1),
                    )),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: controller.completed()/controller.names.length,
                    color: Color(0xFF335cc1),
                    backgroundColor: Color(0xFFbababa),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: Colors.green,
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Completed",
                              style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff707070))),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "${controller.completed()} Sessions",
                              style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff454545))),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_right,
                        color: Colors.blue,
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pending",
                              style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff707070))),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "${controller.pending()} Sessions",
                              style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff454545))),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
