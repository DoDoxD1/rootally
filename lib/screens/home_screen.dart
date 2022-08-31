import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rootally/controllers/sessions_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'home_screen_widgets/todays_progress.dart';
import 'package:jiffy/jiffy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Query _query;

  int i = 3;

  final SessionController controller = Get.put(SessionController());

  @override
  void initState() {
    super.initState();
    // final ref = FirebaseDatabase.instance.ref();
    // final snapshot = await ref.child('sessions').get();
    // if (snapshot.exists) {
    //   print(snapshot.value);
    // } else {
    //   print('No data available.');
    // }
    print(controller.times[0]);
  }

  @override
  Widget build(BuildContext context) {
    FirebaseDatabase database = FirebaseDatabase.instance;
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: Text(
                    'Good Morning\nJane',
                    style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2e2e2e))),
                    textAlign: TextAlign.start,
                  ),
                ), //greeting
                SizedBox(
                  height: 18,
                ),
                TodayProgressWidget(),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.names.length,
                    itemBuilder: (context, index) {
                      return TimelineTile(
                        indicatorStyle: IndicatorStyle(
                          color: index>1? Colors.grey:Color(0xFF335cc1),
                          height: 30,
                          width: 30,
                        ),
                        beforeLineStyle: LineStyle(
                          color: index>1? Colors.grey:Color(0xFF335cc1),
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFababaab)),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, top: 8, bottom: 8, right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.names[index],
                                        style: GoogleFonts.notoSans(
                                            textStyle: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff2e2e2e))),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF335cc1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: Text(
                                          index<=1?"Completed":"Incompleted",
                                          style: GoogleFonts.notoSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text("Performed At"),
                                      Text(controller.times[index]),
                                    ],
                                  ),
                                  Image(image: AssetImage('asset/session.png'),width: MediaQuery.of(context).size.width*0.38,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        isFirst: index == 0 ? true : false,
                        isLast:
                            index == controller.names.length - 1 ? true : false,
                      );
                    },
                  ),
                ),
                // HomeSessions(),
                // Text("data"),
              ],
            ),
          ),
        ),
        floatingActionButton: buildStartSessionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget buildStartSessionButton() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: FloatingActionButton.extended(
          onPressed: () async {
            i++;
            // String time = dateToday.toString().substring(10, 16);
            // int hr = int.parse(time.substring(0, 2));
            // print("hello threre $hr");
            // if (hr > 12)
            //   time + "pm";
            // else
            //   time + "am";

            var date = Jiffy().format("dd-MM-yyyy");
            var hrStr = Jiffy().format("HH:mm");
            print(date);
            int hr = int.parse(hrStr.substring(0,2));
            var time = "";
            if(hr>12) {
              hr = hr-12;
              time = "$hr${hrStr.substring(2,5)}pm";
            }
            else{
              time = "${hrStr}am";
            }
            print(time);
            controller.addSession("session $i", date, date);
            int id = new DateTime.now().millisecondsSinceEpoch;
            DatabaseReference ref = FirebaseDatabase.instance.ref("sessions/$id");
            await ref.set({
              "name": "session $i",
              "date": date,
              "time": time,
            });
          },
          label: Text("Start Session"),
          icon: Icon(Icons.play_arrow),
          backgroundColor: Color(0xFF335cc1),
        ),
      );
}
