import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:rootally/screens/home_screen.dart';
import 'package:rootally/screens/rehab_screen.dart';
import 'package:rootally/controllers/bottom_nav_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    title: 'Rootally AI',
    showSemanticsDebugger: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final screens = [
    const HomeScreen(),
    RehabScreen(),
    Scaffold(body: Center(child: Text("Practice"),),),
    Scaffold(body: Center(child: Text("Profile"),),),
    // const HomeScreen(),
    // RehabScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final NavController c = Get.put(NavController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: c.index.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          backgroundColor: Color(0xFFe2e2e2),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xff6b6b6b),
          currentIndex: c.index.value,
          onTap: (index) {
            print("i am clicked here" + c.index.toString());
            c.changeIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.calendar_today_outlined),
            ),
            BottomNavigationBarItem(
              label: "Rehab",
              icon: Icon(Icons.man_outlined),
            ),
            BottomNavigationBarItem(
              label: "Practice",
              icon: Icon(Icons.compass_calibration_outlined),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_outline_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
