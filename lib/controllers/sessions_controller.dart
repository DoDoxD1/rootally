import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rootally/SessionDataModel.dart';

class SessionController extends GetxController{
  var names = ['Session 1', 'Session 2', 'Session 3'].obs;

  var dates = ['10-02-2022', '10-02-2022', '10-02-2022'].obs;

  var times = ['10:20am', '10:20am', '10:20am'].obs;


  addSession(var name,var date,var time) {
    names.add(name);
    dates.add(date);
    times.add(time);
  }
}