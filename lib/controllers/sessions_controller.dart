import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rootally/SessionDataModel.dart';

class SessionController extends GetxController{
  late List names = [].obs;

  late List dates = [].obs;

  late List times = [].obs;

  percentage(){
    return (names.length-2/names.length)*100;
  }

  completed(){
    return 2;
  }

  pending(){
    return names.length-2;
  }

  addSession(var name,var date,var time) {
    names.add(name);


    dates.add(date);
    times.add(time);
  }
}