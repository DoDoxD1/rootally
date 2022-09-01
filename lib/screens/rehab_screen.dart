import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rootally/SessionDataModel.dart';
import 'package:rootally/controllers/sessions_controller.dart';

class RehabScreen extends StatelessWidget {
  RehabScreen({Key? key}) : super(key: key);

  final SessionController controller = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: Text(
                    'Rehab Programme',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2e2e2e))),
                    textAlign: TextAlign.start,
                  ),
                ), //heading
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("asset/img.png"),
                      width: MediaQuery.of(context).size.width * 0.85,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2e2e2e))),
                      textAlign: TextAlign.start,
                    ),
                    const Icon(
                      Icons.filter_alt_sharp,
                      size: 32,
                      color: Color(0xff2e2e2e),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xFFe6e6e6),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Total Sessions",
                                style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff2e2e2e))),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.sports_gymnastics,
                                    size: 28,
                                    color: Color(0xFF335cc1),
                                  ),
                                  Text(
                                    "${controller.names.length}",
                                    style: GoogleFonts.notoSans(
                                        textStyle: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff2e2e2e))),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Text("|"),
                          Column(
                            children: [
                              Text(
                                "Total Time",
                                style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff2e2e2e))),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 28,
                                    color: Colors.yellow.shade800,
                                  ),
                                  Text(
                                    "${controller.names.length}",
                                    style: GoogleFonts.notoSans(
                                        textStyle: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff2e2e2e))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                Obx(
                  () => ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.names.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('asset/rehab.png'),
                                // image: AssetImage(index%2==0?'"asset/rehab.png"':'"asset/rehaab.png"'),
                                height: 80,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timer_outlined),
                                      Text(controller.times[index]),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 18,
                                      ),
                                      Text(controller.dates[index]),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("View Result"),
                          ),
                        ],
                      ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
